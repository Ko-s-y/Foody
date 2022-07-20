class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource_or_scope)
  #   stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  # end

  def after_sign_in_path_for(resource) # オーバーライド
    if current_admin_user
      flash[:notice] = "管理人ログインに成功しました。"
      rails_admin_path
    else
      posts_path
    end
  end

  def after_sign_out_path_for(resource)
    home_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end
end
