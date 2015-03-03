FactoryGirl.define do
  factory :mailing do
    from 'sender@exemple.com'
    to ['recipient@example.com']
    subject 'Test email'
    body 'Test email content'
  end
end
