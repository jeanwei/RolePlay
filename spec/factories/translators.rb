FactoryGirl.define do
  factory :translator do
    agency
    after(:create) do |translator| 
      create(:profile, profileable: translator)
    end
  end
end
