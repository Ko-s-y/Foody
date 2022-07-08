class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :remembers, dependent: :destroy
  has_many :checked_remember_users, through: :remembers, source: :user
  has_many :notifications, dependent: :destroy

  has_one_attached :avatar

  validates :title, presence: true, length: { maximum: 20 }
  validates :post_content, presence: true, length: { maximum: 200 }
end
