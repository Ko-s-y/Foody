class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    if current_user.update(current_user_params)
      flash[:notice] = "アカウント情報を更新しました。"
    else
      flash[:alert] = "アカウント情報の更新に失敗しました。"
    end
    redirect_to users_show_path
  end

  private

  def current_user_params
    params.require(:user).permit(:avatar)
  end

end
