FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    street '112 Main St.'
    city 'New Orleans'
    state 'LA'
    country 'USA'
    password 'password'
    password_confirmation 'password'
  end
end
