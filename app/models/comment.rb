class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one_attached :avatar

  validates :comment_content, presence: true, length: { maximum: 100 }
end
