FactoryBot.define do
  factory :comment do
    comment_content { "MyText" }
    image { "MyString" }
    association :user
    association :post
  end
end
