class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    flash[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to posts_url
  end
end
