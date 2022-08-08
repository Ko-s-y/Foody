class FollowsController < ApplicationController
  before_action :authenticate_user!, :set_user, only: [:create, :destroy]

  def create
    current_user.follow!(@user.id)
    @user.create_notification_follow!(current_user)
  end

  def destroy
    current_user.unfollow!(@user.id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
