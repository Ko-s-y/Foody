require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe '新規投稿について' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ログインしている場合' do
      scenario '新規投稿出来て、投稿一覧に表示されている事' do
        login_as(@user)
        visit posts_path
        fill_in 'post[title]', with: '投稿テストのタイトル'
        fill_in 'post[post_content]', with: '結合テスト中です'
        click_button "投稿する"

        expect(current_path).to eq(posts_path)
        expect(page).to have_content('投稿テストのタイトル')
        expect(page).to have_content('結合テスト中です')
      end
    end

    context 'ログインしていない場合' do
      scenario '投稿一覧ページに遷移出来ずログインページにリダイレクトされる事' do
        visit posts_path

        expect(current_path).to eq user_session_path
      end
    end
  end

  describe '投稿の編集ついて' do
    before do
      @post = FactoryBot.create(:post)
    end

    context '投稿の作成者がログインしているとき' do
      scenario '投稿の編集ページに既に値がセットされている事' do
        login_as(@post.user)
        visit edit_post_path(@post)

        expect(find('#post_title').value).to eq(@post.title)
        expect(find('#post_post_content').value).to eq(@post.post_content)
      end

      scenario '投稿の更新ができる事' do
        login_as(@post.user)
        visit edit_post_path(@post)
        fill_in 'post_title', with: "編集したタイトル"
        fill_in 'post_post_content', with: "編集した内容"
        click_button "投稿を更新する"

        expect(current_path).to eq posts_path
        expect(page).to have_content("編集した内容")
      end
    end

    context '投稿者以外がログインしている場合' do
      before do
        @other_user = FactoryBot.create(:user, email: 'inspect@com')
      end

      scenario '投稿編集ページに遷移出来ず投稿一覧ページにリダイレクトされる事' do
        login_as(@other_user)
        visit edit_post_path(@post)

        expect(current_path).to eq posts_path
        expect(page).to have_content("権限がありません")
      end
    end

    context 'ログインしていない場合' do
      scenario '投稿編集ページに遷移出来ずログインページにリダイレクトされる事' do
        visit edit_post_path(@post)

        expect(current_path).to eq user_session_path
      end
    end
  end
end
