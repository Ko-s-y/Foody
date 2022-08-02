class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :content, presence: true
end
