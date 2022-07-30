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

  # like　=> notification
  def create_notification_like!(current_user)
    # すでにlikeされているか検索
    like_record = Notification.where([
      "visitor_id = ? and visited_id = ? and post_id = ? and action = ? ",
      current_user.id,
      user_id,
      id,
      'like',
    ])
    # likeされていない場合のみ、通知レコードを作成
    if like_record.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するlikeは、通知済みに（通知されない）
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # remember　=> notification
  def create_notification_remember!(current_user)
    # すでにrememberされているか検索
    remember_record = Notification.where([
      "visitor_id = ? and visited_id = ? and post_id = ? and action = ? ",
      current_user.id,
      user_id,
      id,
      'remember',
    ])
    # rememberされていない場合のみ、通知レコードを作成
    if remember_record.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'remember'
      )
      # 自分の投稿に対するrememberは、通知済みに
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # comment　=> notification
  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みに
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得
    commented_user_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    # その全員に通知を送る
    commented_user_ids.each do |commented_user_id|
      save_notification_comment!(current_user, comment_id, commented_user_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者にのみ通知
    save_notification_comment!(current_user, comment_id, user_id) if commented_user_ids.blank?
  end

  def self.looks(search, word)
    # 空文字があれば
    if word.include?("")
      words = word.split(/[[:blank:]]+/)
      word_1 = words.first
      word_2 = words.second
      posts = Post.where("title LIKE ? AND title LIKE ?", "%#{word_1}%", "%#{word_2}%").or(Post.where("post_content LIKE ? AND post_content LIKE ?", "%#{word_1}%", "%#{word_2}%")).or(Post.where("title LIKE ? AND post_content LIKE ?", "%#{word_1}%", "%#{word_2}%")).or(Post.where("post_content LIKE ? AND title LIKE ?", "%#{word_1}%", "%#{word_2}%"))
    # 空文字なければ
    else
      posts = Post.where("title LIKE ? OR post_content LIKE ?", "%#{word}%", "%#{word}%")
    end
    posts = posts.order(id: :DESC)
    posts # 明示的に記載しないとrubocopにUselessAssignmentと怒られるため(searches/controllerで使ってます)
  end
end
