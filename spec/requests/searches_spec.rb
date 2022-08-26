require 'rails_helper'

RSpec.describe "Searches", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '#result' do
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
end
