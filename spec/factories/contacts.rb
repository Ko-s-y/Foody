FactoryBot.define do
  factory :contact do
    name { "MyString" }
    content { "MyText" }
    association :user
  end
end
