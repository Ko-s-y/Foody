require 'rails_helper'

RSpec.describe 'Contacts', type: :system, js: true do
  describe 'お問合せ作成機能について' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ログインしている場合' do
      scenario 'お問合せ内容を記入したら確認ページに遷移させ内容が表示されている事' do
        login_as(@user)
        visit new_contact_path
        fill_in 'name', with: 'お問合せテストのタイトル'
        fill_in 'content', with: 'お問合せ結合テスト中です'
        click_button "入力内容を確認"

        expect(current_path).to eq(confirm_contacts_path)
        expect(page).to have_content('お問合せテストのタイトル')
        expect(page).to have_content('お問合せ結合テスト中です')
      end
    end

    context 'ログインしていない場合' do
      scenario '投稿編集ページに遷移出来ずログインページにリダイレクトされる事' do
        visit new_contact_path

        expect(page).to have_content('アカウント登録もしくはログインしてください。')
        expect(current_path).to eq user_session_path
      end
    end
  end

  describe 'お問合せ確認機能ついて' do
    before do
      @user = FactoryBot.create(:user)
      @contact = FactoryBot.build(:contact, user_id: @user.id)
    end

    context 'ログインしている場合' do
      scenario '確認ページに遷移にて内容を送信するとデータが登録されている事' do
        login_as(@user)
        visit new_contact_path
        fill_in 'name', with: @contact.name
        fill_in 'content', with: @contact.content
        click_button "入力内容を確認"

        expect { click_button "この内容で送信する" }.to change { Contact.count }.by(1)
        expect(current_path).to eq contacts_path
        expect(page).to have_content(@contact.name)
        expect(page).to have_content(@contact.content)
      end
    end
  end
end
