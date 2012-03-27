require 'spec_helper'

describe SubscriptionsController do
  describe "/checkout" do
    it "should redirect to moip" do
      post :checkout, payment: {total: 99, subscriptions_attributes: [valid_subscription]}
      response.should redirect_to MoIP::Client.moip_page(session[:_payment_token])
    end
  end
end
