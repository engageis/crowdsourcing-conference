require 'machinist/active_record'

Event.blueprint do
end

EventTranslation.blueprint do
end

Payment.blueprint do
  payer_name          { Faker::Name.name }
  payer_email         { Faker::Internet.email }
  city                { Faker::Address.city }
  state               { Faker::AddressUS.state }
  total               { 99900 }
  payment_method      { 'BoletoBancario' }
  net_amount          { 979.63 }
  total_amount        { 999 }
  service_tax_amount  { 19.37 }
  payment_status      { 'BoletoImpresso' }
  service_code        { '000.0000123' }
  institution_of_payment { 'Itau' }
  payment_date        { "2011-09-30T09:33:37.000-03:00".to_datetime }
end

Subscription.blueprint do
  payment     { Payment.make! }
  name        { Faker::Name.name }
  email       { Faker::Internet.email }
  kind        { Subscription::KINDS[0] }
  birthday    { "1978-02-02" }
  company     { Faker::Company.name }
  role        { Faker::Company.position }
  phone       { "(00)0000-0000" }
  phone_cell  { "(00)0000-0000" }
  sex         { "M" }
  city        { Faker::Address.city }
  state       { Faker::AddressUS.state }
end

Schedule.blueprint do
  day {1}
  time {"08:15"}
end

ScheduleTranslation.blueprint do
end

Profile.blueprint do
  name    { Faker::Name.name }
  company { Faker::Company.name }
  kind    { "Speaker" }
  avatar  { File.new("#{Rails.root}/spec/fixtures/sample_images/avatar.jpg") }
end

ProfileTranslation.blueprint do
end


