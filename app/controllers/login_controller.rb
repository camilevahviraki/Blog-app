class LoginController < ApplicationController
  def index
    @form = Post.new
  end

  def posts
    post = Post.new(Title: params[:post][:Title], Text: params[:post][:Text], author_id: current_user.id)
    post.save
  end

  def comments
    post = Post.last
    Comment.create(Text: params[:comment][:Text], author_id: current_user.id, posts_id: post.id)
  end
end    