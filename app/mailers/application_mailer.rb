class ApplicationMailer < ActionMailer::Base
  default from: Setting.sender_address
  layout 'mailer'

  after_action :set_delivery_options

  private
 
    def set_delivery_options
      mail.delivery_method.settings.merge!(
        address:   Setting.smtp_host,
        user_name: Setting.smtp_user,
        password:  Setting.smtp_password
      )
    end
    
end
