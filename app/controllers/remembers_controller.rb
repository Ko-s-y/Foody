class RemembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @remember = current_user.remembers.create(post_id: params[:post_id])
    @remember.save
    @post = @remember.post
    @post.create_notification_remember!(current_user)
    # redirect_to post_path(params[:post_id]),ajaxいらなければ外す
  end

  def destroy
    @remember = Remember.find_by(post_id: params[:post_id], user_id: current_user.id)
    @post = @remember.post
    @remember.destroy
    # redirect_to post_path(params[:post_id]),ajaxいらなければ外す
  end
end
