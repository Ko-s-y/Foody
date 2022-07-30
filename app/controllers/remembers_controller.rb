class RemembersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @remember = current_user.remembers.create(post_id: params[:post_id])
    @remember.save
    @post = @remember.post
    @post.create_notification_remember!(current_user)
  end

  def destroy
    @remember = Remember.find_by(post_id: params[:post_id], user_id: current_user.id)
    @post = @remember.post
    @remember.destroy
  end
end
