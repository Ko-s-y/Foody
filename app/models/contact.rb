class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 300 }
end
