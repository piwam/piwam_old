FactoryBot.define do
  factory :status do
    sequence(:label) { |n| "President #{n}" }
  end
end