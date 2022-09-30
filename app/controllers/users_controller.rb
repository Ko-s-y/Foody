class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile, :followings, :followers]

  def show
    @posts = current_user.posts.all.order(created_at: :desc)
    @remember_posts = current_user.checked_remember_posts.order(created_at: :desc)
    get_received_count(current_user, @posts)
  end

  def profile
    @posts = @user.posts.all.order(created_at: :desc)
    get_received_count(@user, @posts)
  end

  def followings
    @following_users = @user.following_user
  end

  def followers
    @follower_users = @user.follower_user
  end

  def update
    if current_user.update(current_user_params)
      flash[:notice] = "アイコン画像を更新しました。"
    else
      flash[:alert] = "アイコン画像の更新に失敗しました。"
    end
    redirect_to users_show_url
  end

  private

  def current_user_params
    params.require(:user).permit(:avatar)
  end

  def set_user
    @user = User.find_by(name: params[:name])
  end

  def get_received_count(user, posts)
    @received_like = 0
    @received_remember = 0
    @posts.each do |post|
      post.likes.each do |like|
        if like.user_id != user.id
          @received_like += 1
        end
      end
    end
    @posts.each do |post|
      post.remembers.each do |remember|
        if remember.user_id != user.id
          @received_remember += 1
        end
      end
    end
  end
end
