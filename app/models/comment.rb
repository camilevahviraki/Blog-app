class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comment_count(post)
    comment = Comment.where(posts_id: post)
    posts = Post.find(post)
    posts.update(CommentsCounter: comment.length)
  end
end
