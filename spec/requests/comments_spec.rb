require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @user.id)
    @comment = FactoryBot.create(:comment, post_id: @post.id)
  end

  describe '#create' do
    let(:comment_params) { attributes_for(:comment, post_id: @post.id) }
    let(:invalid_comment_params) { attributes_for(:comment, post_id: @post.id, comment_content: '') }

    context '認証済みユーザーの場合' do
      it 'パラメーターが適切であればコメントできる事' do
        sign_in @user
        expect do
          post post_comments_path(@post.id), params: { comment: comment_params }
        end.to change(@post.comments, :count).by(1)
      end

      it 'パラメーターが不適切であれば投稿できない事' do
        sign_in @user
        expect do
          post post_comments_path(@post.id), params: { comment: invalid_comment_params }
        end.not_to change(@post.comments, :count)
      end
    end

    context 'ゲストの場合' do
      it 'コメントできない事' do
        expect do
          post post_comments_path(@post.id), params: { comment: comment_params }
        end.not_to change(Post, :count)
      end

      it 'リクエストが失敗する事' do
        post post_comments_path(@post.id)
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        post post_comments_path(@post.id)
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
