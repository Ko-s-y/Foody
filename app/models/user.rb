class User < ApplicationRecord

  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  devise :validatable, password_length: 8..128
  validates :name, presence: true, uniqueness: { scope: :name }, length: { maximum: 12, minimum: 6 }
end
