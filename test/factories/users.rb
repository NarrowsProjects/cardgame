FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    password { "Ab1@" }
  end
end
