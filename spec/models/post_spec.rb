require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }

  before do
    @post = build(:post)
  end

  describe 'post validation test' do
    it 'title,post_content,userが設定されていれば登録出来ること' do
      expect(@post).to be_valid
    end

    it 'titleが空の場合は無効な状態であること' do
      @post.title = ''
      expect(@post.valid?).to eq(false)
    end

    it '20文字以内であれば登録出来ること' do
      @post = FactoryBot.build(:post, title: 'a' * 20)
      expect(@post.valid?).to eq(true)
    end

    it 'titleが20文字以上の場合は無効な状態であること' do
      @post = FactoryBot.build(:post, title: 'a' * 21)
      @post.valid?
      expect(@post.errors[:title]).to include('は20文字以下に設定して下さい。')
    end

    it 'post_contentが空の場合は無効な状態であること' do
      @post.title = ''
      expect(@post.valid?).to eq(false)
    end

    it 'post_contentが200以内であれば登録出来ること' do
      @post = FactoryBot.build(:post, post_content: 'a' * 200)
      expect(@post.valid?).to eq(true)
    end

    it 'post_contentが200文字以上の場合は無効な状態であること' do
      @post = FactoryBot.build(:post, post_content: 'a' * 201)
      @post.valid?
      expect(@post.errors[:post_content]).to include('は200文字以下に設定して下さい。')
    end
  end
end
