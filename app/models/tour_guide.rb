class TourGuide < ActiveRecord::Base
  has_one :profile, as: :profileable
  has_one :user, through: :profile 
  has_many :tourists
  belongs_to :agency
  delegate :email, to: :profile

  def self.created_with(user_id)
    self.create(agency_id: Agency.first.id) { |role| role.create_profile(user_id: user_id) }
  end
end
