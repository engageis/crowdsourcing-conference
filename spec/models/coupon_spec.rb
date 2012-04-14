require 'spec_helper'

describe Coupon do
  subject { Coupon.make! }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :value }
end
