class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  def update_comment_count
    @post = Post.all
    @post.each do |post|
      comment = Comment.where(posts_id: post.id)
      posts = Post.find(post.id)
      posts.update(CommentsCounter: comment.length)
    end
  end
end
