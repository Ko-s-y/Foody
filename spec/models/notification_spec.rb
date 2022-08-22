require 'rails_helper'

RSpec.describe Notification, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @comment = FactoryBot.build(:comment)
  end

  describe '通知機能 Notification の登録について' do
    context 'Postに対して' do
      it 'Commentが行われた場合に通知される事' do
        notification = FactoryBot.build(:notification, post_id: @post.id, action: "comment")
        expect(notification).to be_valid
      end

      it 'Likeが行われた場合に通知される事' do
        notification = FactoryBot.build(:notification, post_id: @post.id, action: "like")
        expect(notification).to be_valid
      end

      it 'Rememberが行われた場合に通知される事' do
        notification = FactoryBot.build(:notification, post_id: @post.id, action: "remember")
        expect(notification).to be_valid
      end
    end

    context 'Followに対して' do
      it 'フォローが行われた場合に通知される事' do
        base_user = FactoryBot.build(:user)
        other_user = FactoryBot.build(:user)
        notification = FactoryBot.build(:notification, visitor_id: base_user.id, visited_id: other_user.id, action: "follow")
        expect(notification).to be_valid
      end
    end
  end

  describe 'Notificationモデルのアソシエーションについて' do
    let(:association) do
      described_class.reflect_on_association(user)
    end

    context '仮想モデルVisitorとのアソシエーション' do
      let(:user) { :visitor }

      it 'Visitorモデルとの関連付けはbelongs_toである事' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context '仮想モデルVisitedとのアソシエーション' do
      let(:user) { :visited }

      it 'Visitedモデルとの関連付けはbelongs_toである事' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context '一般モデルとのアソシエーション' do
      it 'Postモデルとの関連付けはbelongs_toである事' do
        expect(Notification.reflect_on_association(:post).macro).to eq :belongs_to
      end

      it 'Commentモデルとの関連付けはbelongs_toである事' do
        expect(Notification.reflect_on_association(:comment).macro).to eq :belongs_to
      end
    end
  end
end
