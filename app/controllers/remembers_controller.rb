class RemembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @remember = current_user.remembers.create(post_id: params[:post_id])
    @remember.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @remember = Remember.find_by(post_id: params[:post_id], user_id: current_user.id)
    @remember.destroy
    redirect_to post_path(params[:post_id])
  end
end
