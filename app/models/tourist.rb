class Tourist < ActiveRecord::Base
  has_one :profile, as: :profileable
  has_one :user, through: :profile 
  belongs_to :tour_guide
  belongs_to :translator
  delegate :email, to: :user
  
  def self.created_with(user_id)
    self.create { |role| role.create_profile(user_id: user_id) }
  end

  def self.find_by(options={})
    if options[:email]
      User.find_by(options).as_tourist
    else
      super
    end
  end
end
