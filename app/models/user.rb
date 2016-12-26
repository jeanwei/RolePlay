class User < ActiveRecord::Base
  include UserProfiler::UserProfiler
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :profiles

  def roles=(role)
    @roles = role.map { |r| r.gsub(/\s/, "").constantize unless r.blank?}.compact
    @roles = [Tourist] if @roles.include?(Tourist)
  end

  def roles
    @roles
  end
end
