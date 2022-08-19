class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :Title, presence: true
  validates :Title, length: { maximum: 250 }
  validates :LikesCounter, numericality: true
  validates :LikesCounter, comparison: { greater_than_or_equal_to: 0 }

  def update_posts_count
    @users = User.all
    @users.each do |user|
      post = Post.where(author_id: user.id)
      users = User.find(user.id)
      users.update(PostsCounter: post.length)
    end
  end

  def recents_comments(_post)
    Comment.order(created_at: :asc).last(5)
  end
end
