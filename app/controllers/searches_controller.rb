class SearchesController < ApplicationController
  before_action :authenticate_user!

  def result
    @range = params[:range]
    if @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    elsif @range == "Comment"
      @comments= Comment.looks(params[:search], params[:word])
    else
      flash[:alert] = "エラーが発生しました"
      redirect_to root_path
    end
  end
end
