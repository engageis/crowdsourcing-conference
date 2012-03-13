require 'spec_helper'

describe EventTranslation do
  it{ should validate_presence_of :text }
  it{ should belong_to :event }
end
