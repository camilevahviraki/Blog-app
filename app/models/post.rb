class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :Title, presence: true
  validates :Title, length: { maximum: 250,
                              too_long: '%<count>s characters is the maximum allowed' }
  validates :LikesCounter, numericality: true
  validates :LikesCounter, comparison: { greater_than_or_equal_to: 0 }

  def update_posts_count(user)
    post = Post.where(author_id: user)
    users = User.find(user)
    users.update(PostsCounter: post.length)
  end

  def recents_comments(post)
    Comment.where(posts_id: post).last(5)
  end
end
