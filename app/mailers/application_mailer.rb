class ApplicationMailer < ActionMailer::Base
  default from: Setting.sender_address
  layout 'mailer'
end
