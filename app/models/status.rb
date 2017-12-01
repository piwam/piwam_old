class Status < ApplicationRecord

  validates :label, presence: true, uniqueness: true

  def to_s
    label
  end
  
end
