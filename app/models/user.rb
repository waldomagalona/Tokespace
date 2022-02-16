class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_many :active_connections, class_name:"Connection", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_connections, source: :followed

  has_many :passive_connections, class_name:"Connection", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_connections, source: :follower

  def follow(user)
    active_connections.create(followed_id: user.id)
  end
  def unfollow(user)
    active_connections.find_by(followed_id: user.id).destroy
  end
  def following?(user)
    following.include?(user)
  end

end
