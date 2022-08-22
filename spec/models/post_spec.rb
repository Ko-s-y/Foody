require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }

  before do
    @post = build(:post, user_id: user.id)
  end

  describe '投稿機能 Post の登録について' do
    context '登録出来る場合' do
      it 'title,post_content,user_idが設定されていれば登録出来る事' do
        expect(@post).to be_valid
      end

      it 'titleが20文字以内であれば登録出来る事' do
        @post = FactoryBot.build(:post, title: 'a' * 20)
        expect(@post.valid?).to eq(true)
      end

      it 'post_contentが200文字以内であれば登録出来る事' do
        @post = FactoryBot.build(:post, post_content: 'a' * 200)
        expect(@post.valid?).to eq(true)
      end
    end

    context '登録できない場合' do
      it 'user_idが空ではコメント出来ない事' do
        @post.user_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include 'Userを入力してください'
      end

      it 'titleが空の場合は無効な状態である事' do
        @post.title = ''
        expect(@post.valid?).to eq(false)
      end

      it 'post_contentが空の場合は無効な状態である事' do
        @post.post_content = ''
        expect(@post.valid?).to eq(false)
      end

      it 'titleが20文字以上の場合は無効な状態である事' do
        @post = FactoryBot.build(:post, title: 'a' * 21)
        @post.valid?
        expect(@post.errors[:title]).to include('は20文字以下に設定して下さい。')
      end

      it 'post_contentが200文字以上の場合は無効な状態である事' do
        @post = FactoryBot.build(:post, post_content: 'a' * 201)
        @post.valid?
        expect(@post.errors[:post_content]).to include('は200文字以下に設定して下さい。')
      end
    end
  end

  describe 'Postモデルのアソシエーションについて' do
    it 'Userモデルとの関連付けはbelongs_toである事' do
      expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
