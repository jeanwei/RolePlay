FactoryGirl.define do
  factory :tour_guide do
    agency
    after(:create) do |tour_guide| 
      create(:profile, profileable: tour_guide)
    end
  end
end
