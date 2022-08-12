class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :Title, presence: true
  validates :Title, length: { maximum: 250,
                              too_long: '%<count>s characters is the maximum allowed' }
  validates :LikesCounter, numericality: true
  validates :LikesCounter, comparison: { greater_than_or_equal_to: 0 }
end
