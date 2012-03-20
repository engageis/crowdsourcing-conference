require 'spec_helper'

describe Payment do
  it{ should have_many(:subscriptions) }

  describe "validations" do
    it{ should validate_presence_of :payer_name }
    it{ should validate_presence_of :payer_email }
    it{ should validate_presence_of :city }
    it{ should validate_presence_of :state }
    it{ should validate_presence_of :total }
  end

  describe "instance methods" do
    subject { Payment.make! }
    before(:all){ I18n.locale = "pt-BR" }
    its(:display_service_tax) { should == 'R$ 19,37' }
    its(:display_total_amount) { should == 'R$ 999,00' }
    its(:display_net_amount) { should == 'R$ 979,63' }
    its(:display_payment_date) { should == '30/09/2011, 09:33 h'}
    after(:all){ I18n.locale = I18n.default_locale }
  end

  describe "#update_from_service" do
    subject { Payment.new payer_name: "Jonh", payer_email: "foo@foo.com", city: "Lorem", state: "Lorem", total: 999 }
    
    context "with invalid Token" do
      before(:each) do
        @moip_response =  MoIP::Client.stub(:query).and_return([])
      end

      it "should not fill payment details" do
        subject.update_from_service

        subject.payment_method.should be_nil
        subject.net_amount.should be_nil
        subject.total_amount.should be_nil
        subject.service_tax_amount.should be_nil
        subject.payment_status.should be_nil
        subject.service_code.should be_nil
        subject.institution_of_payment.should be_nil
        subject.payment_date.should be_nil
      end
    end

    context 'with valid Token and payment response contain a array' do
      before(:each) do
        @moip_response = MoIP::Client.stub(:query).and_return(moip_query_response_with_array)
      end

      it "fill the payment" do
        subject.payment_method.should be_nil
        subject.net_amount.should be_nil
        subject.total_amount.should be_nil
        subject.service_tax_amount.should be_nil
        subject.payment_status.should be_nil
        subject.service_code.should be_nil
        subject.institution_of_payment.should be_nil
        subject.payment_date.should be_nil

        subject.update_from_service

        subject.payment_method.should_not be_nil
        subject.net_amount.should_not be_nil
        subject.total_amount.should_not be_nil
        subject.service_tax_amount.should_not be_nil
        subject.payment_status.should_not be_nil
        subject.service_code.should_not be_nil
        subject.institution_of_payment.should_not be_nil
        subject.payment_date.should_not be_nil
      end
    end

    context "with valid Token" do
      before(:each) do
        @moip_response = MoIP::Client.stub(:query).and_return(moip_query_response)
      end

      it "fill the payment" do
        subject.payment_method.should be_nil
        subject.net_amount.should be_nil
        subject.total_amount.should be_nil
        subject.service_tax_amount.should be_nil
        subject.payment_status.should be_nil
        subject.service_code.should be_nil
        subject.institution_of_payment.should be_nil
        subject.payment_date.should be_nil

        subject.update_from_service

        subject.payment_method.should_not be_nil
        subject.net_amount.should_not be_nil
        subject.total_amount.should_not be_nil
        subject.service_tax_amount.should_not be_nil
        subject.payment_status.should_not be_nil
        subject.service_code.should_not be_nil
        subject.institution_of_payment.should_not be_nil
        subject.payment_date.should_not be_nil
      end
    end
  end

  describe "key" do
    subject{ Payment.make! }
    its(:key){ should_not be_nil }
  end
end