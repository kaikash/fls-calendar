class UserUpdatePasswordForm
  include SimpleFormObject

  attribute :old_password, :string
  attribute :new_password, :string
  attribute :email, :string

  validates :new_password, presence: true, length: {in: 6..255}
  validates :old_password, presence: true, length: {in: 6..255}
  validate :check_authenticate, if: [:old_password, :new_password]

  def user
    User.find_by_email @email
  end

  def check_authenticate
    if !user.try(:authenticate, @old_password)
      errors.add(:old_password, :password_invalid)
      return
    end
  end

  def save
    return false unless valid?
    if !user.update(password: @new_password)
      errors.add(:new_password, :error)
      return false
    end
    true
  end
end