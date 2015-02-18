class Status < ActiveRecord::Base

  nilify_blanks

  has_many :members
  belongs_to :creator, class_name: 'Member', foreign_key: 'created_by'
  belongs_to :updater, class_name: 'Member', foreign_key: 'updated_by'

  validates :label, presence: true, uniqueness: true

  def to_s
    label
  end

end
