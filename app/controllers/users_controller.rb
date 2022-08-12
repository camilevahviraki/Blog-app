class UsersController < ApplicationController
  def last_3_post(author)
    Post.where(author_id: author).last(3)
  end
end
