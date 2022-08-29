require 'rails_helper'

RSpec.describe "Comments", type: :system, js: true do
  describe 'コメント投稿について' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post)
    end

    context 'ログインしている場合' do
      scenario '投稿にコメント出来て、投稿詳細ページに表示されている事' do
        login_as(@user)
        visit post_path(@post)
        find('.form-appear').click
        fill_in 'comment[comment_content]', with: 'コメント機能結合テスト中です'

        expect { click_button "コメントする" }.to change { @post.comments.count }.by(1)
        expect(current_path).to eq(post_path(@post))
        expect(page).to have_content('コメント機能結合テスト中です')
      end
    end

    context 'ログインしていない場合' do
      scenario '投稿詳細ページに遷移出来ずログインページにリダイレクトされる事' do
        visit post_path(@post)

        expect(current_path).to eq user_session_path
      end
    end
  end

  describe 'コメント削除について' do
    before do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.create(:user)
      @not_comment_user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user_id: @user.id)
      @comment = FactoryBot.create(:comment, user_id: @user.id, post_id: @post.id)
      @other_comment = FactoryBot.create(:comment, user_id: @other_user.id, post_id: @post.id)
    end

    context 'ログインしているuserがPost投稿主である場合' do
      scenario 'コメントツリーの右側に削除機能のゴミ箱マークが表示されていて削除機能が動作している事' do
        login_as(@user)
        visit post_path(@post)
        find('.right-trash').click
        sleep 1

        expect(page.driver.browser.switch_to.alert.accept)
        expect(page).to have_content('コメントを削除しました')
      end
    end

    context 'ログインしているuserがPost投稿主では無い場合' do
      scenario 'コメントツリーの左側に削除機能のゴミ箱マークが表示されていて削除機能が動作している事' do
        login_as(@other_user)
        visit post_path(@post)
        find('.left-trash').click
        sleep 1

        expect(page.driver.browser.switch_to.alert.accept)
        expect(page).to have_content('コメントを削除しました')
      end
    end

    context 'ログインしているuserがPost投稿主では無くかつComment投稿主でもない場合' do
      scenario 'コメントツリーに削除機能のゴミ箱マークが表示されていない事' do
        login_as(@not_comment_user)
        visit post_path(@post)

        expect(page).to have_no_selector('.left-trash')
        expect(page).to have_no_selector('.right-trash')
      end
    end
  end
end
