class UsersController < ApplicationController
  before_action :authenticate_user!

  # my page
  def show
    @posts = current_user.posts.all.order(created_at: :desc)
    received_counter(@posts)
  end

  # 他ユーザーページ
  def profile
    @user = User.find_by(name: params[:name])
    @posts = @user.posts.all.order(created_at: :desc)
    received_counter(@posts)
  end

  def update
    if current_user.update(current_user_params)
      flash[:notice] = "アイコン画像を更新しました。"
    else
      flash[:alert] = "アイコン画像の更新に失敗しました。"
    end
    redirect_to users_show_path
  end

  private

  def current_user_params
    params.require(:user).permit(:avatar)
  end

  def received_counter(posts)
    # いいねをもらった回数
    @received_like = 0
    @posts.each do |post|
      @received_like += post.likes.count
    end
    # rememberされた回数
    @received_remember = 0
    @posts.each do |post|
      @received_remember += post.remembers.count
    end
  end
end
