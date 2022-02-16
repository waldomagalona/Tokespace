class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  scope :following, -> (followers) { where user_id: followers }
end
