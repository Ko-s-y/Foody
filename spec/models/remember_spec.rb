require 'rails_helper'

RSpec.describe Remember, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  before do
    @remember = build(:remember)
  end

  it 'userと1対多となっている事' do
    expect(Remember.reflect_on_association(:user).macro).to eq :belongs_to
  end

  it 'postと1対多となっている事' do
    expect(Remember.reflect_on_association(:post).macro).to eq :belongs_to
  end

  it 'user,postが設定されていればremember出来る事' do
    expect(@remember).to be_valid
  end

  it "user_idが同じでもpost_idが違えばrememberできる" do
    another_remember = FactoryBot.create(:remember)
    expect(FactoryBot.create(:remember, post_id: another_remember.post_id)).to be_valid
  end

  it "post_idが同じでもuser_idが違えばrememberできる" do
    another_remember = FactoryBot.create(:remember)
    expect(FactoryBot.create(:remember, user_id: another_remember.user_id)).to be_valid
  end
end
