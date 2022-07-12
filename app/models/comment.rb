class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  has_one_attached :avatar

  validates :comment_content, presence: true, length: { maximum: 200 }
end
