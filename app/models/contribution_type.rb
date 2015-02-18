class ContributionType < ActiveRecord::Base

  nilify_blanks

  has_many :contributions
  belongs_to :creator, class_name: 'Member', foreign_key: 'created_by'
  belongs_to :updater, class_name: 'Member', foreign_key: 'updated_by'

  validates_presence_of :label, :expires_on, :amount
  validates_uniqueness_of :label
  validates :amount, numericality: { greater_than: 0 }

end
