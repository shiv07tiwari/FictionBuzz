class User < ApplicationRecord
  has_secure_password
  has_many :buzzs, dependent: :destroy

  has_many :followed_users, class_name: "FollowRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, through: :followed_users

  has_many :following_users, class_name: "FollowRelationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :following_users


  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :handle, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create
end
