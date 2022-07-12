class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    post = @comment.post
    if @comment.save
      flash[:notice] = "投稿にコメントしました。"
      post.create_notification_comment!(current_user, @comment.id)
    else
      flash[:alert] = @comment.errors.full_messages[0]
    end
    redirect_to post_path(@comment.post_id)
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      flash[:notice] = "コメントを削除しました。"
    else
      flash[:alert] = "不正な処理の為エラーが発生しました。"
    end
    redirect_to post_path(post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :avatar, :post_id)
  end
end
