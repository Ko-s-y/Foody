require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:follow) { FactoryBot.create(:follow) }

  describe 'フォロー機能 Follow の登録について' do
    context '登録できる場合' do
      it 'follower_id, followed_idが設定されていればフォローできる事' do
        expect(follow).to be_valid
      end
    end

    context '登録できない場合' do
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
        @inspection_user = FactoryBot.build(:follow)
      end

      it "follower_idとfollowed_idの組み合わせは一意でなければ保存できない" do
        other_follow = FactoryBot.build(:follow, follower_id: @follow.follower_id, followed_id: @follow.followed_id)
        other_follow.valid?
        expect(other_follow.errors[:follower_id]).to include("はすでに存在します")
      end

      it "follower_idが同じでもfollowed_idが違うなら保存できる" do
        other_follow = FactoryBot.build(:follow, follower_id: @follow.follower_id, followed_id: @inspection_user.followed_id)
        expect(other_follow).to be_valid
      end

      it "follower_idが違うならfollowed_idが同じでも保存できる" do
        other_follow = FactoryBot.build(:follow, follower_id: @inspection_user.follower_id, followed_id: @follow.followed_id)
        expect(other_follow).to be_valid
      end
    end
  end

  describe "Followモデルのアソシエーションについて" do
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
