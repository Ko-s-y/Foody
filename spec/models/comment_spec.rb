require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  before do
    @comment = build(:comment)
  end

  it 'userと1対多となっている事' do
    expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
  end

  it 'postと1対多となっている事' do
    expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
  end

  it 'comment_content,user,postが設定されていれば登録出来る事' do
    expect(@comment).to be_valid
  end

  it 'comment_contentが空の場合は無効な状態である事' do
    @comment.comment_content = ''
    expect(@comment.valid?).to eq(false)
  end

  it 'comment_contentが200文字以上の場合は無効な状態である事' do
    @comment = FactoryBot.build(:comment, comment_content: 'a' * 201)
    @comment.valid?
    expect(@comment.errors[:comment_content]).to include('は200文字以下に設定して下さい。')
  end
end
