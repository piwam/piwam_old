class MemberMailer < ApplicationMailer

  def mailing(mailing_id)
    @mailing = Mailing.find(mailing_id)
    mail(from: @mailing.from, to: @mailing.to, subject: @mailing.subject)
  end

end
