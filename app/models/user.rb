class User < ApplicationRecord
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
end
