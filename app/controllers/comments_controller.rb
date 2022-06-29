class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "投稿にコメントしました"
    else
      flash[:alert] = "コメントの投稿に失敗しました"
    end
    redirect_to post_path(@comment.post_id)
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      flash[:notice] = "コメントを削除しました"
    else
      flash[:alert] = "エラーが発生しました"
    end
    redirect_to post_path(post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content,:avatar, :post_id)
  end
end
