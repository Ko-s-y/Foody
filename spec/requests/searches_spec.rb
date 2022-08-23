require 'rails_helper'

RSpec.describe "Searches", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '#result' do
    context '認証済みユーザーの場合' do
      it '投稿一覧にリダイレクトする事' do
        sign_in @user
        get searches_result_path
        expect(response).to redirect_to posts_path
      end
    end
  end

  context 'ゲストの場合' do
    it 'リクエストが失敗する事' do
      get searches_result_path
      expect(response.status).to eq 302
    end

    it 'ログインページにリダイレクトする事' do
      get searches_result_path
      expect(response).to redirect_to user_session_path
    end
  end
end
