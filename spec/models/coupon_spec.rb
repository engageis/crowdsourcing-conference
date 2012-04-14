require 'spec_helper'

describe Coupon do
  subject { Coupon.make! }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :value }

  context 'checking coupon' do
    before(:each) do
      Coupon.make!(name: 'ABCD', value: 10)
    end

    it 'When is not valid' do
      check = Coupon.check_for_request('ABDE')
      check[:message].should =~ /Invalid Coupon/
    end

    it 'When is valid' do
      check = Coupon.check_for_request('ABCD')
      check[:message].should =~ /Valid Coupon/
    end
  end
end
