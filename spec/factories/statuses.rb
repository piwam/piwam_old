FactoryGirl.define do
  factory :status do
    sequence(:label) { |n| "Président #{n}" }
  end
end
