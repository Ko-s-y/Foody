class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else
      @comments= Comment.looks(params[:search], params[:word])
    end
  end
end
