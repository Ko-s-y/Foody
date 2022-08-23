require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe '#new' do
    it 'リクエストが成功する事' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    context 'パラメータが適切な場合' do
      it 'リクエストが成功する事' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 200
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功する事' do
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
    subject { get edit_user_registration_path }

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'リクエストが成功すること' do
        is_expected.to eq 200
      end

      it 'responds successfully' do
        get edit_user_registration_path(user.id)
        expect(response).to be_successful
      end
    end

    context 'ゲストの場合' do
      it 'リダイレクトされること' do
        is_expected.to redirect_to new_user_session_path
      end
    end
  end
end
