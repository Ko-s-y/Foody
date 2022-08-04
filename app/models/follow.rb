class Follow < ApplicationRecord
  belongs_to :followed, class_name: "User" #　フォローしたユーザー
  belongs_to :follower, class_name: "User" #　フォローされたユーザー
end
