class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :likes
  has_many :posts
  has_many :comments
  validates :Name, presence: true, allow_blank: true
  validates :PostsCounter, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  after_save :add_token

  def last_3_post(author)
    Post.where(author_id: author).last(3)
  end

  def add_token
    update_column(:authentication_token, ApiHelper::JsonWebToken.encode(email))
  end
end
