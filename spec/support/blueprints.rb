require 'machinist/active_record'

Event.blueprint do
end

EventTranslation.blueprint do
end

Subscription.blueprint do
  name {"John"}
  email {"john@gmail.com"}
  type {"First day"}
  birthday {"1978-02-02"}
  company {"John SA"}
  role {"CEO"}
  phone {"00 0000-0000"}
  phone_cell {"00 0000-0000"}
  sex {"M"}
end

Schedule.blueprint do
  day {1}
  time {"08:15"}
end

ScheduleTranslation.blueprint do
end
