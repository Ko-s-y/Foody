class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @post = current_user.posts.new   #投稿一覧画面で新規投稿を行うので、formのパラメータ用にPostオブジェクトを取得
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "新規投稿しました。"
    else
      flash[:alert] = "投稿に失敗しました"
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :post_content, :avatar)
  end
end
