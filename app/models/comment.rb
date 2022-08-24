class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  def update_comment_count(post)
    comment = Comment.where(posts_id: post)
    posts = Post.find(post)
    posts.update(CommentsCounter: comment.length)
  end
end
