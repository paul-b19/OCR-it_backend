class User < ApplicationRecord
  has_many :records

  validates :username, uniqueness: true
  has_secure_password
end
