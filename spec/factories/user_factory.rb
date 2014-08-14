FactoryGirl.define do
  factory :user do
    first_name 'Sonu'
    last_name 'Singh'
    password 'password'
    password_confirmation 'password'
    gender 'male'
    mobile '8956231472'
    email 'user@mailinator.com'
  end
end
