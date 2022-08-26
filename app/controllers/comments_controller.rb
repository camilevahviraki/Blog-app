class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    redirect_to("/users/#{params[:user_id]}/posts/#{params[:post_id]}", notice: 'Comment created.') if @comment.save
  end

  def comment_params
    params.require(:comment).permit(:Text, :author_id, :posts_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to("/users/#{params[:user_id]}/posts/#{params[:id]}", notice: 'Comment deleted.') if @comment.destroy
  end
end
