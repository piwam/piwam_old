class Contribution < ActiveRecord::Base

  nilify_blanks

  belongs_to :account
  belongs_to :contribution_type, counter_cache: true
  belongs_to :member
  belongs_to :creator, class_name: 'Member', foreign_key: 'created_by'
  belongs_to :updater, class_name: 'Member', foreign_key: 'updated_by'

  validates_presence_of :account_id, :contribution_type_id, :member_id, :date, :amount
  validates :amount, numericality: { greater_than: 0 }

end
