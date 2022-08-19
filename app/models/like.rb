class Like < ApplicationRecord
  belongs_to :user

  def update_like_counter
    all_posts = Post.all
    all_posts.each do |post|
      l_posts = Post.find(post.id)
      likes = Like.where(posts_id: post.id)
      l_posts.update(LikesCounter: likes.length)
    end
  end
end
