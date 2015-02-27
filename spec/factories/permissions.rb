FactoryGirl.define do
  factory :permission do
    member
    action 'index'
    controller 'Account'
  end
end
