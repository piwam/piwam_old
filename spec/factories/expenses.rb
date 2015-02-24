FactoryGirl.define do
  factory :expense do
    label 'Achats divers'
    amount 34.50
    account
    activity
    date '2015-02-24'
  end
end
