class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  def action_user
    @post = Post.find(params[:id])
    @liked_users = @post.liked_users
    @remember_users = @post.checked_remember_users
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "新規投稿しました。"
    else
      flash[:alert] = @post.errors.full_messages[0]
    end
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render "edit"
    else
      flash[:alert] = "権限がありません"
      redirect_to posts_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿の情報を更新しました。"
      redirect_to posts_url
    else
      flash.now[:alert] = "更新に失敗しました。"
      render "edit"
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
      flash[:notice] = "投稿を削除しました。"
    else
      flash[:alert] = "不正な処理の為エラーが発生しました。"
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :post_content, :avatar)
  end
end
