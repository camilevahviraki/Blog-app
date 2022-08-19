class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    likes = Like.new
    likes.update_like_counter
    @user = User.find(params[:id])
    post = User.new
    @last_posts = post.last_3_post(params[:id])
    @all_posts = Post.where(author_id: params[:id])
  end
end
