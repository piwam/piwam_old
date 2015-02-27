class Permission < ActiveRecord::Base

  nilify_blanks

  belongs_to :member

  validates_presence_of :member_id, :action, :controller

  def to_s
    [controller, action].join('_').downcase
  end

end
