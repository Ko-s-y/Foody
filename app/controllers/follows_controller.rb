class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow!(params[:user_id])
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user)
  end

  def destroy
    current_user.unfollow!(params[:user_id])
    @user = User.find(params[:user_id])
  end
end
