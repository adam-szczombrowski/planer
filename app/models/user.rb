class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :name, presence: true, length: { minimum: 2 }
end
