class Api::V1::PostsController < ApplicationController
  def index
    authentication_token = params[:authentication_token]
    return unless check_user_token(authentication_token) && check_post_params

    @posts = Post.where(author_id: params[:user_id])
    render json: @posts
  end

  def show
    authentication_token = params[:authentication_token]
    return unless check_user_token(authentication_token) && check_post_params

    @comments = Comment.where(posts_id: params[:id])
    render json: @comments
  end

  def check_user_token(authentication_token)
    if authentication_token.nil?
      render json: { error: 'Invalid token.' }, status: 400
      false
    elsif !authenticate(authentication_token)
      render json: { error: 'Not authorized.' }, status: 401
      false
    elsif !User.exists?(params[:user_id])
      render json: { error: 'User does not exist' }, status: 404
      false
    else
      true
    end
  end

  def authenticate(authentication_token)
    email = ApiHelper::JsonWebToken.decode(authentication_token)[0]
    user = User.find_by(email:)
    return false if user.nil?

    @current_user = user
    true
  end
end
