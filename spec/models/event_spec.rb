require 'spec_helper'

describe Event do
  it{ should validate_presence_of :text }
end
