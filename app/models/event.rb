class Event < ActiveRecord::Base
  translates :text
  has_many :event_translations
  accepts_nested_attributes_for :event_translations#, :allow_destroy => true
end
