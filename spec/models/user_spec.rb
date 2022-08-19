require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'user validation test' do
    it 'name,email,introduction,password,confirmed_at,agreement_termsが設定されていたら有効' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空の場合は無効な状態であること' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'nameが5文字以下の場合は無効な状態であること' do
      @user = FactoryBot.build(:user, name: 'aaaaa')
      @user.valid?
      expect(@user.errors[:name]).to include('は6文字以上に設定して下さい。')
    end

    it 'nameが12文字以上の場合は無効な状態であること' do
      @user = FactoryBot.build(:user, name: 'a' * 13)
      @user.valid?
      expect(@user.errors[:name]).to include('は12文字以下に設定して下さい。')
    end

    it 'emailが空の場合は無効な状態であること' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'introductionが空の場合は無効な状態であること' do
      @user.introduction = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが空の場合は無効な状態であること' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが7文字以下の場合は無効な状態であること' do
      @user = FactoryBot.build(:user, password: 'a' * 7)
      @user.valid?
      expect(@user.errors[:password]).to include('は8文字以上に設定して下さい。')
    end

    it 'agreement_termsが空の場合は無効な状態であること' do
      @user.agreement_terms = false
      expect(@user.valid?).to eq(false)
    end
  end
end
