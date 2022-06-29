FactoryBot.define do
  factory :post do
    title { "MyString" }
    post_content { "MyText" }
    user { nil }
    image { "MyString" }
  end
end
