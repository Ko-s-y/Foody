FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "testname#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { |n| "test#{n}pass" }
    sequence(:introduction) { |n| "test#{n}" }
    confirmed_at { Date.today }
    agreement_terms { true }
  end
end
