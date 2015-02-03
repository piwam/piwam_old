FactoryGirl.define do
  factory :member do
    last_name     { Faker::Name.last_name }
    first_name    { Faker::Name.first_name }
    registered_on { Faker::Date.backward(15) }
    email         { Faker::Internet.free_email }
    street        { Faker::Address.street_address }
    postal_code   { Faker::Address.postcode }
    city          { Faker::Address.city }
    country       { [Faker::Address.default_country, Faker::Address.country].sample }
    website       { [Faker::Internet.url, nil].sample }
    phone_number  { [Faker::PhoneNumber.phone_number, nil].sample }
    mobile_number { [Faker::PhoneNumber.phone_number, nil].sample }    
  end
end