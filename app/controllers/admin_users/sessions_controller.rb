# frozen_string_literal: true

class AdminUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    if current_user.nil?
      # render file: Rails.root.join('public', '404.html'), layout: false, status: 404
      redirect_to root_url
      flash[:alert] = "権限がありません"
    elsif current_user.email == ENV["FOODY_ADMIN_ADDRESS"]
      flash[:alert] = "管理人としてこちらよりログインしてください"
      super
    elsif current_user.email != ENV["FOODY_ADMIN_ADDRESS"]
      # render file: Rails.root.join('public', '404.html'), layout: false, status: 404
      redirect_to posts_url
      flash[:alert] = "権限がありません"
    else
      # render file: Rails.root.join('public', '404.html'), layout: false, status: 404
      redirect_to root_url
      flash[:alert] = "権限がありません"
    end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
