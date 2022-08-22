FactoryBot.define do
  factory :remember do
    association :user
    association :post
  end
end
