class Member < ActiveRecord::Base

  has_secure_password validations: false
  nilify_blanks

  validates_presence_of :last_name, :first_name
  validates :email, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true
  validates :password, length: { in: 6..20 }, allow_blank: true

end
