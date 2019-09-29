class User < ApplicationRecord
  has_secure_password
  has_secure_token

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :token, uniqueness: true
end
