class User < ApplicationRecord
  has_many :scores
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
