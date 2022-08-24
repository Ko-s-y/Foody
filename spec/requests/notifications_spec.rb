require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '#index' do
    context '認証済みユーザーの場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get notifications_path
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get notifications_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get notifications_path
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#checked' do
    context '認証済みユーザーの場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get checked_notifications_path
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get notifications_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get notifications_path
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
