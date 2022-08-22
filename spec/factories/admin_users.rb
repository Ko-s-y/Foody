FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { |n| "test#{n}pass" }
  end
end
