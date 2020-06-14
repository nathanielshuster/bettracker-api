class User < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  validates :username, :email, :password_digest, :presence => true
  validates :username, :email, :password_digest, length: { minimum: 5 }
  validates :username, :email, :uniqueness => true

  has_secure_password
end
