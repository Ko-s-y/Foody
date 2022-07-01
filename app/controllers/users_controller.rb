class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = current_user.posts.all.order(id: :desc)
  end

  def profile
    @user = User.find_by(name: params[:name])
    @posts = @user.posts.all.order(id: :desc)
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
end
