FactoryBot.define do
  factory :post do
    title { "MyString" }
    post_content { "MyText" }
    association :user
  end
end
