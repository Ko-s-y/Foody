class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @like.save
    @post = @like.post
    @post.create_notification_like!(current_user)
    # redirect_to post_path(params[:post_id]),ajaxいらなければ外す
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @post = @like.post
    @like.destroy
    # redirect_to post_path(params[:post_id]),ajaxいらなければ外す
  end
end
