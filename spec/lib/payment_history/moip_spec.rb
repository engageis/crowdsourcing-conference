require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe PaymentHistory::Moip do
  before(:each) do
    MoIP::Client.stub(:query).and_return(moip_query_response)
  end

  describe "When receive params of POST request" do
    context "when create log" do
      it 'should have a payment log in backer after receive request' do
        payment = Payment.make!
        subscription = Subscription.make! payment: payment
        payment.update_attribute :key, 'ABCD'

        params = post_moip_params.merge!({:id_transacao => 'ABCD', :status_pagamento => PaymentHistory::Moip::TransactionStatus::AUTHORIZED})
        moip_request = PaymentHistory::Moip.new(params).process_request!
        moip_request.response_code.should == PaymentHistory::Moip::ResponseCode::SUCCESS
      end
    end

    context "workflow" do
      before(:each) do
        @payment = Payment.make!
        subscription = Subscription.make! payment: @payment
        @payment.update_attribute :key, 'ABCD'
        @payment.reload

        @payment_with_wrong_value = Payment.make! :total => 998.00
        @payment_with_wrong_value.update_attribute :key, 'ABCDE'
        @payment_with_wrong_value.reload

        @params = post_moip_params
      end

      subject { PaymentHistory::Moip.new(@params.merge!({:status_pagamento => PaymentHistory::Moip::TransactionStatus::AUTHORIZED})) }
      context 'with wrong payment' do
        subject { PaymentHistory::Moip.new(@params.merge!({:id_transacao => 'ABCDE'})) }

        it {
          subject.process_request!
          subject.response_code.should == PaymentHistory::Moip::ResponseCode::NOT_PROCESSED
        }
      end

      context 'with correct payment' do
        subject { PaymentHistory::Moip.new(@params) }
        it "with not found paymet fill the response_code with 422" do
          moip = PaymentHistory::Moip.new(post_moip_params.merge!(:id_transacao => '1234'))
          moip.response_code.should be_nil
          moip.process_request!
          moip.response_code.should == PaymentHistory::Moip::ResponseCode::NOT_PROCESSED
        end
      end
    end
  end

  it 'Response code enum' do
    transaction = PaymentHistory::Moip::ResponseCode
    transaction::NOT_PROCESSED.should ==  422
    transaction::SUCCESS.should       ==  200
  end

  it 'Transaction status enum' do
    transaction = PaymentHistory::Moip::TransactionStatus
    transaction::AUTHORIZED.should      ==  1
    transaction::STARTED.should         ==  2
    transaction::PRINTED_BOLETO.should  ==  3
    transaction::FINISHED.should        ==  4
    transaction::CANCELED.should        ==  5
    transaction::PROCESS.should         ==  6
    transaction::WRITTEN_BACK.should    ==  7
  end
end