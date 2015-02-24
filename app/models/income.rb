class Income < ActiveRecord::Base

  nilify_blanks

  belongs_to :account
  belongs_to :activity
  belongs_to :creator, class_name: 'Member', foreign_key: 'created_by'
  belongs_to :updater, class_name: 'Member', foreign_key: 'updated_by'

  validates_presence_of :label, :amount, :account_id, :activity_id, :date
  validates :amount, numericality: { greater_than: 0 }

  scope :received, -> { where(received: true) }

end
