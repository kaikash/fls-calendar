class User < ActiveRecord::Base
  has_many :events
  has_secure_password
  paginates_per 40

  validates :email, presence: true, length: {in: 6..255}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  validates :name, presence: true, length: { in: 3..255 }
  validates :surname, presence: true, length: { in: 3..255 }
end
