class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :posts
  has_many :comments
  # validates :Name, presence: true, allow_blank: true
  # validates :PostsCounter, numericality: true
  # validates :PostsCounter, comparison: { greater_than_or_equal_to: 0, allow_nil: true}

  def last_3_post(author)
    Post.where(author_id: author).last(3)
  end
end
