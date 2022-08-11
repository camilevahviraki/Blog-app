class LikesController < ApplicationController
  def update_like_counter(post)
    likes = Like.where(posts_id: post)
    l_posts = Post.find(post)
    l_posts.update(LikesCounter: likes.length)
  end
end
