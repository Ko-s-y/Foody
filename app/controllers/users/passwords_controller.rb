class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_user, only: :create

  def ensure_normal_user
    if params[:user][:email].downcase == "guest@sample.com"
      flash[:alert] = "ゲストユーザーのパスワード再設定はできません。"
      redirect_to posts_url
    end
  end
end
