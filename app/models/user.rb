class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :remembers, dependent: :destroy
  has_many :checked_remember_posts, through: :remembers, source: :post
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :validatable, password_length: 8..128

  with_options presence: true,
               uniqueness: { scope: :name },
               length: { maximum: 12, minimum: 6 },
               format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数字のみ使用してください。' } do
    validates :name
  end

  validates :introduction, presence: true, length: { maximum: 10 }

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
end
