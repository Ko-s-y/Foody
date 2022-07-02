class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like_post = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @like_post.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    like_post = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like_post.destroy
    redirect_to post_path(params[:post_id])
  end
end
