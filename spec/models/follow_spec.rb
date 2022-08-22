require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:follow) { FactoryBot.create(:follow) }

  describe 'likeの生成について' do
    context '生成できる場合' do
      it '値が揃っていれば保存できる事' do
        expect(follow).to be_valid
      end
    end

    context '生成できない場合' do
      it "follower_idがnilの場合は保存できない事" do
        follow.follower_id = nil
        follow.valid?
        expect(follow.errors[:follower_id]).to include("を入力してください")
      end

      it "followed_idがnilの場合は保存できない事" do
        follow.followed_id = nil
        follow.valid?
        expect(follow.errors[:followed_id]).to include("を入力してください")
      end
    end

    context 'フォロー機能の一意性' do
      before do
        @follow = FactoryBot.create(:follow)
        @user1 = FactoryBot.build(:follow)
      end

      it "follower_idとfollowed_idの組み合わせは一意でなければ保存できない" do
        follow2 = FactoryBot.build(:follow, follower_id: @follow.follower_id, followed_id: @follow.followed_id)
        follow2.valid?
        expect(follow2.errors[:follower_id]).to include("はすでに存在します")
      end

      it "follower_idが同じでもfollowed_idが違うなら保存できる" do
        follow2 = FactoryBot.build(:follow, follower_id: @follow.follower_id, followed_id: @user1.followed_id)
        expect(follow2).to be_valid
      end

      it "follower_idが違うならfollowed_idが同じでも保存できる" do
        follow2 = FactoryBot.build(:follow, follower_id: @user1.follower_id, followed_id: @follow.followed_id)
        expect(follow2).to be_valid
      end
    end
  end

  describe "userモデルとのアソシエーションについて" do
    let(:association) do
      described_class.reflect_on_association(user)
    end

    context "仮想モデルfollowerとのアソシエーション" do
      let(:user) { :follower }

      it "Followerとの関連付けはbelongs_toであること" do
        expect(association.macro).to  eq :belongs_to
      end
    end

    context "仮想モデルfollowedとのアソシエーション" do
      let(:user) { :followed }

      it "Followedとの関連付けはbelongs_toであること" do
        expect(association.macro).to  eq :belongs_to
      end
    end
  end
end
