class Account < ActiveRecord::Base

  nilify_blanks

  belongs_to :creator, class_name: 'Member', foreign_key: 'created_by'
  belongs_to :updater, class_name: 'Member', foreign_key: 'updated_by'

  validates_presence_of :label, :reference
  validates_uniqueness_of :reference

end
