require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "#show" do
    it "リクエストが成功する事" do
      sign_in @user
      get users_show_path(@user)
      expect(response.status).to eq 200
    end
  end

  describe '#new' do
    it 'リクエストが成功する事' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, name: "") }

    context 'パラメータが適切な場合' do
      it 'リクエストが成功する事' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 200
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエスト自体は成功する事' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      it 'createが失敗する事' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.not_to change(User, :count)
      end

      it 'エラーが表示される事' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include 'エラーにより、このアカウント情報を登録できません'
      end
    end
  end

  describe '#edit' do
    context 'ログインしている場合' do
      before do
        sign_in @user
      end

      it 'リクエストが成功すること' do
        get edit_user_registration_path(@user.id)
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗すること' do
        get edit_user_registration_path
        expect(response.status).to eq 302
      end

      it 'エラーが表示される事' do
        get edit_user_registration_path(@user.id)
        expect(response.body).to include 'アカウント登録もしくはログインしてください。'
      end

      it 'ログインページにリダイレクトする事' do
        get edit_user_registration_path
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
