require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  before do
    @comment = build(:comment, user_id: user.id, post_id: post.id)
  end

  describe 'コメント機能 Comment の登録について' do
    context '登録できる場合' do
      it 'comment_content,user_id,post_idが設定されていればコメント出来る事' do
        expect(@comment).to be_valid
      end
    end

    context '登録できない場合' do
      it "user_idが空ではコメント出来ない事" do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Userを入力してください"
      end

      it 'post_idが空ではコメント出来ない事' do
        @comment.post_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Postを入力してください"
      end

      it 'comment_contentが空の場合はコメント出来ない事' do
        @comment.comment_content = ''
        expect(@comment.valid?).to eq(false)
      end

      it 'comment_contentが200文字以上の場合はコメント出来ない事' do
        @comment = FactoryBot.build(:comment, comment_content: 'a' * 201)
        @comment.valid?
        expect(@comment.errors[:comment_content]).to include('は200文字以下に設定して下さい。')
      end
    end
  end

  describe 'Commentモデルのアソシエーションについて' do
    it 'Userモデルとの関連付けはbelongs_toである事' do
      expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it 'Postモデルとの関連付けはbelongs_toである事' do
      expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
    end
  end
end
