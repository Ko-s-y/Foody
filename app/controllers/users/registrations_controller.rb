class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == "guest@sample.com"
      flash[:alert] = "ゲストユーザーは削除できません。"
      redirect_to posts_path
    end
  end
end
