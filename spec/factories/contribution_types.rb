FactoryGirl.define do
  factory :contribution_type do
    label      'Cotisation annuelle 2015'
    expires_on '2015-12-31'
    amount     9.99
  end
end
