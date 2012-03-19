require 'machinist/active_record'

Event.blueprint do
end

EventTranslation.blueprint do
end

Subscription.blueprint do
  name        { Faker::Name.name }
  email       { Faker::Internet.email }
  type        { "First day" }
  birthday    { "1978-02-02" }
  company     { Faker::Company.name }
  role        { Faker::Company.position }
  phone       { "(00)0000-0000" }
  phone_cell  { "(00)0000-0000" }
  sex         { "M" }
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
