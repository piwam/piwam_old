FactoryGirl.define do
  factory :contribution do
    account
    contribution_type
    member
    date   '2015-02-18'
    amount 9.99
  end
end
