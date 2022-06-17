class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  devise :validatable, password_length: 8..128
  validates :name, presence: true, uniqueness: { scope: :name }, length: { maximum: 10, minimum: 6 }
end
