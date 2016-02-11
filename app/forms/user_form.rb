class UserForm
  include SimpleFormObject

  attribute :password, :string
  attribute :email, :string

  validates :password, presence: true, length: {in: 6..255}
  validates :email, presence: true, length: {in: 6..255}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :check_authenticate, if: :email

  def user
    User.find_by_email @email
  end

  def check_authenticate
    if !user.try(:authenticate, @password)
      errors.add(:password, :email_or_password_invalid)
      return
    end
  end
end