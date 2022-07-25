class SearchesController < ApplicationController
  before_action :authenticate_user!

  def result
    if params[:word].blank?
      flash[:alert] = "不正な値です。キーワードを正確に入力してください。"
      redirect_to posts_path
    end
    @range = params[:range]
    if @range == "Post"
      @posts = Post.looks(params[:search], params[:word]).page(params[:page])
    elsif @range == "Comment"
      @comments = Comment.looks(params[:search], params[:word]).page(params[:page])
    elsif @range == "User"
      @users = User.looks(params[:search], params[:word]).page(params[:page])
    else
      flash[:alert] = "不正な値です。キーワードを正確に入力してください。"
      redirect_to posts_path
    end
  end
end
