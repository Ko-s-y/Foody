class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "投稿にコメントしました"
      redirect_to post_path(@comment.post_id)
    else
      flash.now[:alert] = "コメントに失敗しました"
      render "show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to post_path(@post.id)
  end


  private

  def comment_params
    params.require(:comment).permit(:comment_content,:avatar, :post_id)
  end
end
