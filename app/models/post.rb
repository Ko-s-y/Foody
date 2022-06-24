class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar

  validates :title, presence: true
  validates :post_content, presence: true
end
