require 'spec_helper'

describe Subscription do
  it{ should belong_to(:payment) }

  describe "validations" do
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :email }
    it{ should validate_presence_of :kind }
    it{ should validate_presence_of :birthday }
    it{ should validate_presence_of :company }
    it{ should validate_presence_of :role }
    it{ should validate_presence_of :phone }
    it{ should validate_presence_of :phone_cell }
    it{ should validate_presence_of :sex }
    it{ should validate_presence_of :city }
    it{ should validate_presence_of :state }
    it{ should validate_presence_of :payment }
    it{ should allow_value("foo@bar.com").for :email }
    it{ should_not allow_value("@bar.com").for :email }
    it{ should_not allow_value("foo@bar.").for :email }
  end

  describe "paid" do
    context "with new subscription" do
      subject{ Subscription.new }
      its(:paid){ should be_false }
      its(:paid_at){ should be_nil }
    end
  end

  describe "#paid!" do
    subject{ Subscription.make! }
    before{ subject.paid! }
    its(:paid){ should be_true }
    its(:paid_at){ should_not be_nil }
  end

  describe "#paid?" do
    context "with not paid subscription" do
      subject{ Subscription.new }
      its(:paid?){ should be_false }
    end

    context "with paid subscription" do
      subject{ Subscription.make! }
      before{ subject.paid! }
      its(:paid?){ should be_true }
    end
  end
end
