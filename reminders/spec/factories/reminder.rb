# Define factory for creating a reminder =
FactoryGirl.define do
  factory :reminder do
    user_id  ""
    name {"User #{user_id}'s reminder"}
    content {"This reminder belongs to user #{user_id}."}
  end
end

