class PostsController < ApplicationController
  def index
    Post.new.update_posts_count
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @posts_comments = []
    Post.includes(:posts)
    @posts.each_with_index do |post, id|
      comments = Comment.where(posts_id: post.id)
      @likes = Like.where(posts_id: params[post.id]).length
      users_and_comnts = []
      comments.each do |comment|
        user = User.where(id: comment.author_id)[id].Name
        users_and_comnts << { username: user, comment: }
      end
      @posts_comments << { post:, user_and_comnt: users_and_comnts }
    end
  end

  def show
    Post.new.update_posts_count
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @likes = Like.where(posts_id: params[:id]).length
    comments = Comment.where(posts_id: @post.id)

    @users_and_comnts = []
    comments.each do |comment|
      user = User.where(id: comment.author_id)[0].Name
      @users_and_comnts << { username: user, comment: }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    redirect_to("/users/#{params[:user_id]}/posts", notice: 'Post was successfully created.') if @post.save
  end

  def post_params
    params.require(:post).permit(:Title, :Text, :author_id)
  end
end
