class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  has_one_attached :avatar

  validates :comment_content, presence: true, length: { maximum: 200 }

  def self.looks(search, word)
    # 空文字があれば
    if word.include?(" ") || word.include?("　")
      words = word.split(/[[:blank:]]+/)
      word_1 = words.first
      word_2 = words.second
      @comments = Comment.where("comment_content LIKE ? AND comment_content LIKE ?", "%#{word_1}%", "%#{word_2}%")
    # 空文字なければ
    else
      @comments = Comment.where("comment_content LIKE ?", "%#{word}%")
    end
    @comments = @comments.order(id: :DESC)
  end
end
