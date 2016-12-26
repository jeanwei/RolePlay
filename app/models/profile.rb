class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :profileable, polymorphic: true
  delegate :email, to: :user

  def self.of_user(id)
    where(user_id: id).map(&:profileable)
  end
  
end
