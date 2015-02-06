class Member < ActiveRecord::Base

  has_secure_password validations: false
  nilify_blanks

  belongs_to :creator, class_name: 'Member', foreign_key: 'created_by'
  belongs_to :updater, class_name: 'Member', foreign_key: 'updated_by'

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

  with_options if: :alone? do |member|
    member.validates :email,    presence: true
    member.validates :password, presence: true
  end

  scope :authenticatable, -> { where.not(email: nil, password_digest: nil) }

  COUNTRIES = %w(BE CH DE ES FR LU NL).freeze

  def to_s
    [first_name, last_name].join(' ')
  end

  private

    def alone?
      !Member.exists?
    end

end
