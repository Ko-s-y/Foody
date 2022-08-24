require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  scenario 'user登録時正常に確認用メールが送信される事' do
    expect do
      visit home_path
      find('#to-registration-path').click
      fill_in 'user[name]', with: 'testname'
      fill_in 'user[introduction]', with: 'フレンチ'
      fill_in 'user[email]', with: 'new@example.com'
      fill_in 'user[password]', with: 'testuser'
      fill_in 'user[password_confirmation]', with: 'testuser'
      find('.spec-policy').click
      click_button "新規登録する"

      expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"
    end
  end

  scenario "登録したuserはログインできる事" do
    login_as(@user)
  end

  scenario "ログインしたuserはログアウトできる事" do
    login_as(@user)
    visit root_path
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
  end

  scenario "ゲストログイン機能が正常に動作する事" do
    visit root_path
    click_link "ゲストログイン"
    expect(page).to have_content "ゲストユーザーとしてログインしました。"
  end

  scenario 'ログインしたuserは情報を更新できる事' do
    login_as(@user)
    visit users_show_path
    click_link "設定"
    fill_in 'user[name]', with: 'newnamedesu'
    fill_in 'user[password]', with: 'new_password'
    fill_in 'user[current_password]', with: @user.password
    click_button "更新する"

    expect(page).to have_content 'アカウント情報を変更しました。'
  end

  scenario 'ログインしたuserはマイページで投稿を確認できる事' do
    login_as(@user)
    visit users_show_path

    expect(page).to have_content "投稿一覧"
    expect(page).to have_content "ブックマーク一覧"
  end
end
