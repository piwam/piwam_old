class Mailing < ActiveRecord::Base

  nilify_blanks

  belongs_to :creator, class_name: 'Member', foreign_key: 'created_by'

  validates_presence_of :from, :to, :subject, :body

  serialize :to, Array

end
