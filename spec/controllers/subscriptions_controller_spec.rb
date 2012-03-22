require 'spec_helper'

describe SubscriptionsController do
  describe "/checkout" do
    it "should redirect to moip" do
      post :checkout, subscriptions: [valid_subscription], payment: {total: 99}
      response.should redirect_to MoIP::Client.moip_page(session[:_payment_token])
    end
  end
end
