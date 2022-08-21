require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  before do
    @like = build(:like)
  end

  it 'userと1対多となっている事' do
    expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
  end

  it 'postと1対多となっている事' do
    expect(Like.reflect_on_association(:post).macro).to eq :belongs_to
  end

  it 'user,postが設定されていればlike出来る事' do
    expect(@like).to be_valid
  end

  it "user_idが同じでもpost_idが違えばlikeできる" do
    another_like = FactoryBot.create(:like)
    expect(FactoryBot.create(:like, post_id: another_like.post_id)).to be_valid
  end

  it "post_idが同じでもuser_idが違えばlikeできる" do
    another_like = FactoryBot.create(:like)
    expect(FactoryBot.create(:like, user_id: another_like.user_id)).to be_valid
  end
end
