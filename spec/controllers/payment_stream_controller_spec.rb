require 'spec_helper'

describe PaymentStreamController do
  render_views

  describe '/moip' do
    it "should confirm payment" do
      payment = Payment.make!
      subscription = Subscription.make! payment: payment
      post :moip, post_moip_params.merge!({:id_transacao => payment.key, :status_pagamento => '1', :valor => payment.moip_value})
      puts response.status.inspect
      response.should be_successful
      for subscription in payment.reload.subscriptions
        subscription.paid.should be_true
      end
    end

    it "should not confirm in case of error payment" do
      payment = Payment.make!
      subscription = Subscription.make! payment: payment
      post :moip, post_moip_params.merge!({:id_transacao => -1, :status_pagamento => '1', :valor => payment.moip_value})
      response.should_not be_successful
      for subscription in payment.reload.subscriptions
        subscription.paid.should_not be_true
      end
    end

    it "should return 422 when moip params is empty" do
      post :moip, {}
      response.should_not be_successful
      response.code.should == '422'
    end

    context 'when receive aonther moip request' do
      before(:each) do
        @payment = Payment.make! :payment_token => 'ABCD'
        subscription = Subscription.make! payment: @payment

        moip_response = moip_query_response.dup
        moip_response["Autorizacao"]["Pagamento"].merge!("Status" => 'BoletoPago')
        MoIP::Client.stub(:query).with('ABCD').and_return(moip_response)
        @payment.reload
      end

      it 'should update info and paid subscription' do
        for subscription in @payment.subscriptions
          subscription.paid.should_not be_true
        end
        @payment.payment_status.should == 'BoletoImpresso'

        post :moip, post_moip_params.merge!({:id_transacao => @payment.key, :status_pagamento => '1', :valor => @payment.moip_value})

        @payment.reload
        @payment.payment_status.should == 'BoletoPago'
        for subscription in @payment.subscriptions
          subscription.paid.should be_true
        end
      end
    end
  end
end
