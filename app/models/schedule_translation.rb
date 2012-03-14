class ScheduleTranslation < ActiveRecord::Base
  belongs_to :schedule
  validates_uniqueness_of :locale, :scope => :schedule_id
  validates :description, presence: true
end
