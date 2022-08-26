class CommentsController < ApplicationController
   def new
    @comment = Comment.new
   end
   
   def create
    @comment = Comment.new(comment_params)
    if @comment.save 
      redirect_to("/users/#{params[:user_id]}/posts/#{params[:post_id]}", notice: 'Comment Successfully created.')
    end
   end

   def comment_params 
     params.require(:comment).permit(:Text, :author_id, :posts_id)
   end
end
