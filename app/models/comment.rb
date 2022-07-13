class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  has_one_attached :avatar

  validates :comment_content, presence: true, length: { maximum: 200 }

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @comment = Comment.where("comment_content LIKE?","#{word}")
    elsif search == "forward_match"
      @comment = Comment.where("comment_content LIKE?","#{word}%")
    elsif search == "backward_match"
      @comment = Comment.where("comment_content LIKE?","%#{word}")
    elsif search == "partial_match"
      @comment = Comment.where("comment_content LIKE?","%#{word}%")
    else
      @comment = Comment.all
    end
  end
end
