require 'spec_helper'

describe ScheduleTranslation do
  it{ should belong_to :schedule }
  it{ should validate_presence_of :description }
end
