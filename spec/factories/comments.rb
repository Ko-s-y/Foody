FactoryBot.define do
  factory :comment do
    comment_content { "MyText" }
    image { "MyString" }
    user { nil }
    post { nil }
  end
end
