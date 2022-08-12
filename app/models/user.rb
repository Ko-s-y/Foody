class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :contacts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :remembers, dependent: :destroy
  has_many :checked_remember_posts, through: :remembers, source: :post

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_many :followed, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  devise :validatable, password_length: 8..128

  with_options presence: true,
               uniqueness: { scope: :name },
               length: { maximum: 12, minimum: 6 },
               format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数字のみ使用してください。' } do
    validates :name
  end

  validates :introduction, presence: true, length: { maximum: 10 }
  validates :agreement_terms, allow_nil: false, acceptance: true, on: :create

  def already_commented?(post)
    comments.exists?(post_id: post.id)
  end

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def checked_remember?(post)
    remembers.exists?(post_id: post.id)
  end

  def self.looks(search, word)
    users = User.where("introduction LIKE ?", "%#{word}%")
    users = users.order(id: :DESC)
    users # 明示的に記載しないとrubocopにUselessAssignmentと怒られるため(searches/controllerで使ってます)
  end

  def self.guest
    find_or_create_by!(email: "guest@sample.com") do |user|
      user.name = "GuestUser"
      user.introduction = "イタリア料理"
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      # user.confirmed_at = Time.now
    end
  end

  def follow!(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow!(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  # follow　=> notification
  def create_notification_follow!(current_user)
    follow_record = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if follow_record.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
