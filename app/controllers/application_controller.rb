class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_admin_user
      flash[:notice] = "管理人ログインに成功しました。"
      rails_admin_url
    else
      posts_url
    end
  end

  def after_sign_out_path_for(resource)
    root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :agreement_terms])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end
end
