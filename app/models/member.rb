class Member < ActiveRecord::Base

  has_secure_password validations: false
  nilify_blanks

  has_attached_file :photo,
                    styles: { original: '116x116#' },
                    url: '/system/:class/:hash.:extension',
                    path: 'public/system/:class/:hash.:extension',
                    hash_secret: '9f611f5ecd85bacd6cde7ce3cccdf49c',
                    hash_data: ':class/:attachment/:id',
                    default_url: 'no_picture.png'

  validates_attachment :photo, content_type: { content_type: /\Aimage\/.*\Z/ }, size: { less_than: 1.megabytes }

  validates_presence_of :last_name, :first_name
  validates :email, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true
  validates :password, length: { in: 6..20 }, allow_blank: true

  COUNTRIES = %w(BE CH DE ES FR LU NL).freeze

end
