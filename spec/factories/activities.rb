FactoryGirl.define do
  factory :activity do
    sequence(:label) { |n| "Activité #{n}" }
  end
end
