require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @user.id)
  end

  describe '#index' do
    context '認証済みユーザーの場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get posts_path
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get posts_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get posts_path
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#new' do
    context '認証済みユーザーの場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get posts_path
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get posts_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get posts_path
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#create' do
    context '認証済みユーザーの場合' do
      let(:post_params) { attributes_for(:post) }
      let(:invalid_post_params) { attributes_for(:post, title: "") }

      it 'パラメーターが適切であれば投稿できる事' do
        sign_in @user
        expect do
          post posts_path, params: { post: post_params }
        end.to change(@user.posts, :count).by(1)
      end

      it 'パラメーターが不適切であれば投稿できない事' do
        sign_in @user
        expect do
          post posts_path, params: { post: invalid_post_params }
        end.not_to change(@user.posts, :count)
      end
    end

    context 'ゲストの場合' do
      let(:post_params) { attributes_for(:post) }
      it '投稿できない事' do
        expect do
          post posts_path, params: { post: post_params }
        end.to_not change(Post, :count)
      end

      it 'リクエストが失敗する事' do
        post posts_path
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        post posts_path
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#show' do
    context '認証済みユーザーの場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get post_path(@post.id)
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get post_path(@post.id)
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get post_path(@post.id)
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#edit' do
    context '認証済みユーザーかつpostの投稿主の場合' do
      it 'リクエストが成功する事' do
        sign_in @user
        get edit_post_path(@post.id)
        expect(response.status).to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        get edit_post_path(@post.id)
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        get edit_post_path(@post.id)
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#update' do
    context '認証済みユーザーかつ投稿主の場合' do
      it '投稿をupdateできる事' do
        post_params = FactoryBot.attributes_for(:post, title: 'update post title')
        sign_in @user
        patch post_path(@post.id), params: { post: post_params }
        expect(@post.reload.title).to eq 'update post title'
      end
    end

    context 'ゲストの場合' do
      it 'リクエストが失敗する事' do
        patch post_path(@post.id)
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        patch post_path(@post.id)
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe '#destroy' do
    context '認証済みユーザーかつpostの投稿主の場合' do
      it '投稿を削除できる事' do
        sign_in @user
        expect { delete post_path(@post.id) }.to change(@user.posts, :count).by(-1)
      end
    end

    context 'ゲストの場合' do
      it '投稿を削除できない事' do
        expect { delete post_path(@post.id) }.to_not change(Post, :count)
      end

      it 'リクエストが失敗する事' do
        delete post_path(@post.id)
        expect(response.status).to eq 302
      end

      it 'ログインページにリダイレクトする事' do
        delete post_path(@post.id)
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
