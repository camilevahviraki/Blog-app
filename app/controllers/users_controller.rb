class UsersController < ApplicationController
  def last_3_post(int)
    Post.where(author_id: int).last(3)
  end
end