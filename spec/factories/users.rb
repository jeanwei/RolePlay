FactoryGirl.define do
  sequence :email do |n|
    "batman#{n}@gmail.com"
  end
  factory :user do
    email
    password 'qwerty123'
    password_confirmation 'qwerty123'
  end
end
