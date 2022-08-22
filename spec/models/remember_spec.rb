require 'rails_helper'

RSpec.describe Remember, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  before do
    @remember = build(:remember, user_id: user.id, post_id: post.id)
  end

  describe 'ブックマーク機能 Remember の登録について' do
    context '登録できる場合' do
      it 'user_id,post_idが設定されていればremember出来る事' do
        expect(@remember).to be_valid
      end

      it "user_idが同じでもpost_idが違えばremember出来る事" do
        another_remember = FactoryBot.create(:remember)
        expect(FactoryBot.create(:remember, post_id: another_remember.post_id)).to be_valid
      end

      it "post_idが同じでもuser_idが違えばremember出来る事" do
        another_remember = FactoryBot.create(:remember)
        expect(FactoryBot.create(:remember, user_id: another_remember.user_id)).to be_valid
      end
    end

    context '登録できない場合' do
      it "user_idが空ではlikeできない" do
        @remember.user_id = nil
        @remember.valid?
        expect(@remember.errors.full_messages).to include "Userを入力してください"
      end

      it "post_idが空ではlikeできない" do
        @remember.post_id = nil
        @remember.valid?
        expect(@remember.errors.full_messages).to include "Postを入力してください"
      end
    end
  end

  describe 'Rememberモデルのアソシエーションについて' do
    it 'Userモデルとの関連付けはbelongs_toである事' do
      expect(Remember.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it 'Postモデルとの関連付けはbelongs_toである事' do
      expect(Remember.reflect_on_association(:post).macro).to eq :belongs_to
    end
  end
end
