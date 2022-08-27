class Api::V1::CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :json => "Post a new comment on this URL 'http://localhost:3000/api/users/1/v1/posts/1/comments/'"
  end    

  def create
      @comment = Comment.new(comment_params)
      if @comment.save
        render :json => "Comment created"
      else
        render :json => ["An error occured, Please send your params in this form =>" => {
            comment: { Text:, Title:, author_id:, post_id: }
          } 
        ], status: 400
      end     
  end

  def comment_params
    params.require(:comment).permit(:Text, :author_id, :posts_id)
  end
end    