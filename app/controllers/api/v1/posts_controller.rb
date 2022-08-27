class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    render :json => @posts
  end

  def show
    @comments = Comment.where(posts_id: params[:id])
    render :json => @comments
  end  
end    