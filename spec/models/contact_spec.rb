require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:user) { FactoryBot.create(:user) }

  before do
    @contact = build(:contact, user_id: user.id)
  end

  describe 'お問い合わせ機能 Contact の登録について' do
    context '登録出来る場合' do
      it 'name,content,user_idが設定されていれば登録出来る事' do
        expect(@contact).to be_valid
      end

      it 'nameが20文字以内であれば登録出来る事' do
        @contact = FactoryBot.build(:contact, name: 'a' * 20)
        expect(@contact.valid?).to eq(true)
      end

      it 'contentが300文字以内であれば登録出来る事' do
        @contact = FactoryBot.build(:contact, content: 'a' * 300)
        expect(@contact.valid?).to eq(true)
      end
    end

    context '登録できない場合' do
      it "user_idが空ではお問合せ出来ない事" do
        @contact.user_id = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include "Userを入力してください"
      end

      it 'nameが空の場合は無効な状態である事' do
        @contact.name = ''
        expect(@contact.valid?).to eq(false)
      end

      it 'contentが空の場合は無効な状態である事' do
        @contact.content = ''
        expect(@contact.valid?).to eq(false)
      end

      it 'nameが20文字以上の場合は無効な状態である事' do
        @contact = FactoryBot.build(:contact, name: 'a' * 21)
        @contact.valid?
        expect(@contact.errors[:name]).to include('は20文字以内で入力してください')
      end

      it 'post_contentが200文字以上の場合は無効な状態である事' do
        @contact = FactoryBot.build(:contact, content: 'a' * 301)
        @contact.valid?
        expect(@contact.errors[:content]).to include('は300文字以内で入力してください')
      end
    end
  end

  describe 'Contactモデルのリレーションについて' do
    it 'Userモデルと1対多となっている事' do
      expect(Contact.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
