class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: [:update, :destroy]

  def ensure_normal_user
    if resource.email == "guest@sample.com"
      flash[:alert] = "ゲストユーザーの更新と削除はできません。"
      redirect_to posts_path
    end
  end

  protected

  def after_update_path_for(resource)
    posts_path
  end
end
