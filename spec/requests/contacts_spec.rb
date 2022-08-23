require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @contact = FactoryBot.create(:contact, user_id: @user.id)
  end

  describe '#index' do
    context '認証済みユーザーの場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get contacts_path
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get contacts_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get contacts_path
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#new' do
    context '認証済みユーザーの場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get new_contact_path
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get new_contact_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get new_contact_path
        expect(response).to redirect_to user_session_path
      end
    end
  end






  describe '#create' do
    context '認証済みユーザーの場合' do
      let(:contact_params) { attributes_for(:contact) }
      let(:invalid_contact_params) { attributes_for(:contact, name: "") }

      it 'パラメーターが不適切であればお問合せできない事' do
        sign_in @user
        expect do
          post contacts_path, params: { contact: invalid_contact_params }
        end.not_to change(@user.contacts, :count)
      end
    end

    context 'ゲストの場合' do
      let(:contact_params) { attributes_for(:contact) }

      it 'リクエストが失敗する事' do
        post contacts_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        post contacts_path
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
