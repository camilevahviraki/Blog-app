class UsersController < ApplicationController
  def index
    Post.new.update_posts_count
    @users = User.all
  end

  def show
    Post.new.update_posts_count
    likes = Like.new
    likes.update_like_counter
    @user = User.find(params[:id])
    post = User.new
    @last_posts = post.last_3_post(params[:id])
    @all_posts = Post.where(author_id: params[:id])
  end
end
