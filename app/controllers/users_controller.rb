class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = current_user.posts.all.order(created_at: :desc)
    @remember_posts = current_user.checked_remember_posts.order(created_at: :desc)
    received_counter(current_user, @posts)
  end

  def profile
    @user = User.find_by(name: params[:name])
    @posts = @user.posts.all.order(created_at: :desc)
    received_counter(@user, @posts)
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

  def received_counter(user, posts)
    # いいねをもらった回数
    @received_like = 0
    @posts.each do |post|
      post.likes.each do |like|
        if like.user_id != user.id
          @received_like += 1
        end
      end
    end
    # rememberされた回数
    @received_remember = 0
    @posts.each do |post|
      post.remembers.each do |remember|
        if remember.user_id != user.id
          @received_remember += 1
        end
      end
    end
  end
end
