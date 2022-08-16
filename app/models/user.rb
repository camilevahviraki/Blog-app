class User < ApplicationRecord
  has_many :likes
  has_many :posts
  has_many :comments
  validates :Name, presence: true
  validates :PostsCounter, numericality: true
  validates :PostsCounter, comparison: { greater_than_or_equal_to: 0 }

  def last_3_post(author)
    Post.where(author_id: author).last(3)
  end
end
