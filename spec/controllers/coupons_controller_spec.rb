require 'spec_helper'

describe CouponsController do
  context 'Coupon validate' do
    it 'when submit an invalid coupon' do
      get :check_consistency, { coupon_name: 'ABCD', format: 'json'}
      ActiveSupport::JSON.decode(response.body)['message'].should =~ /Invalid Coupon/
    end

    it 'when submit an valid coupon' do
      Coupon.make!(name: 'ABCD', value: 20)
      get :check_consistency, { coupon_name: 'ABCD', format: 'json'}
      ActiveSupport::JSON.decode(response.body)['message'].should =~ /Valid Coupon/
      ActiveSupport::JSON.decode(response.body)['value'].should == 20
    end
  end
end
