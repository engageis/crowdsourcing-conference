require 'spec_helper'

describe ProfileTranslation do
  it{ should belong_to :profile }
  it{ should validate_presence_of :bio }
  it{ should validate_presence_of :country }
end
