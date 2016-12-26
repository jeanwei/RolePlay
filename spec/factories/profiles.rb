FactoryGirl.define do
  factory :profile do
    user
    association :profileable
  end
end
