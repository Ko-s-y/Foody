require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  before do
    @like = build(:like, user_id: user.id, post_id: post.id)
  end

  describe 'いいね機能 Like の登録について' do
    context '登録できる場合' do
      it 'user_id,post_idが設定されていればlike出来る事' do
        expect(@like).to be_valid
      end

      it "user_idが同じでもpost_idが違えばlike出来る事" do
        another_like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, post_id: another_like.post_id)).to be_valid
      end

      it "post_idが同じでもuser_idが違えばlike出来る事" do
        another_like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, user_id: another_like.user_id)).to be_valid
      end
    end

    context '登録できない場合' do
      it "user_idが空ではlikeできない" do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "Userを入力してください"
      end

      it "post_idが空ではlikeできない" do
        @like.post_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "Postを入力してください"
      end
    end
  end

  describe 'Likeモデルのアソシエーションについて' do
    it 'Userモデルと1対多となっている事' do
      expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it 'Postモデルと1対多となっている事' do
      expect(Like.reflect_on_association(:post).macro).to eq :belongs_to
    end
  end
end
