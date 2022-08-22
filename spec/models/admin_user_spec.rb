require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  before do
    @admin_user = build(:admin_user)
  end

  describe 'AdminUserの登録について' do
    context 'seedファイルから登録できる場合' do
      it 'email,passwordが設定されていたら登録出来る事' do
        expect(@admin_user.valid?).to eq(true)
      end
    end

    context 'seedファイルから登録できない場合' do
      it 'emailが空の場合は無効な状態である事' do
        @admin_user.email = ''
        expect(@admin_user.valid?).to eq(false)
      end

      it 'passwordが空の場合は無効な状態である事' do
        @admin_user.password = ''
        expect(@admin_user.valid?).to eq(false)
      end
    end
  end
end
