# Define factory for creating a valid user
FactoryGirl.define do
  factory :user do
    email  "user@test.1"
    password "12345678"
    password_confirmation "12345678"
  end
end