FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    password { "password_1" }
  end
end
