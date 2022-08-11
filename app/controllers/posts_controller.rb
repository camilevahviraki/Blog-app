class PostsController < ApplicationController
  def update_posts_count(user)
    post = Post.where(author_id: user)
    users = User.find(user)
    users.update(PostsCounter: post.length)
  end

  def recents_comments(post)
    Comment.where(posts_id: post).last(5)
  end
end
