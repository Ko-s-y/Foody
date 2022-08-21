class Follow < ApplicationRecord
  belongs_to :followed, class_name: "User" # フォローしたユーザー
  belongs_to :follower, class_name: "User" # フォローされたユーザー

  validates :followed_id, presence: true
  validates :follower_id, presence: true, uniqueness: { scope: :followed_id }
end
