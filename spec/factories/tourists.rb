FactoryGirl.define do
  factory :tourist do
    tour_guide
    translator
    after(:create) { |tourist| create(:profile, profileable: tourist) }
  end
end
