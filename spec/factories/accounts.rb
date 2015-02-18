FactoryGirl.define do
  factory :account do
    label 'Compte bancaire'
    sequence(:reference) { |n| "CB#{n}" }
  end
end
