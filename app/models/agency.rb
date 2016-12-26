class Agency < ActiveRecord::Base
  has_many :tour_guides
  has_many :translators
end
