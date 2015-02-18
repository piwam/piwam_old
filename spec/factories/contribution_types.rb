FactoryGirl.define do
  factory :contribution_type do
    sequence(:label) { |n| "Cotisation annuelle #{n}" }
    expires_on '2015-12-31'
    amount     9.99
  end
end
