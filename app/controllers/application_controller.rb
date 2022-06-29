class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource_or_scope)
  #   stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  # end

  def after_sign_in_path_for(resource) # オーバーライド
    posts_path # ログインした後の遷移先
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end
end
