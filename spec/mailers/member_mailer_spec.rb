require "rails_helper"

describe MemberMailer do
  describe "mailing" do
    let(:mailing) { FactoryGirl.create(:mailing, from: 'sender@example.com', to: ['recipient@example.com'], subject: 'Test email', body: 'Test email content') }
    let(:mail) { MemberMailer.mailing(mailing.id) }

    it "assigns attributes correctly" do
      expect(mail.from).to eq(['sender@example.com'])
      expect(mail.to).to eq(['recipient@example.com'])
      expect(mail.subject).to eq('Test email')
      expect(mail.body.encoded).to match('Test email content')
    end
  end
end
