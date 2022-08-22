FactoryBot.define do
  factory :follow do
    followed_id { FactoryBot.create(:user).id }
    follower_id { FactoryBot.create(:user).id }
  end
end
