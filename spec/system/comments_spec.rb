require 'rails_helper'

RSpec.describe "Comments", type: :system do
  describe 'コメント投稿について' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post)
    end

    context 'ログインしている場合' do
      scenario '投稿にコメント出来て、投稿詳細ページに表示されている事' do
        login_as(@user)
        visit post_path(@post)
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
      @post = FactoryBot.create(:post, user_id: @user.id)
      @comment = FactoryBot.create(:comment, user_id: @user.id, post_id: @post.id)
    end

    context 'ログインしていてuserがコメント投稿主である場合' do
      scenario 'コメントツリーの右側に削除機能のゴミ箱マークが表示されていて、削除機能が動作する事' do
        login_as(@user)
        visit post_path(@post)

        expect(page).to have_selector '.right-trash'
      end
    end
  end
end
