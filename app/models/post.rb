class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

  validates :title, presence: true, length: { maximum: 20 }
  validates :post_content, presence: true, length: { maximum: 200 }
end
