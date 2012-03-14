require 'spec_helper'

describe Subscription do
  describe "validations" do
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :email }
    it{ should validate_presence_of :type }
    it{ should validate_presence_of :birthday }
    it{ should validate_presence_of :company }
    it{ should validate_presence_of :role }
    it{ should validate_presence_of :phone }
    it{ should validate_presence_of :phone_cell }
    it{ should validate_presence_of :sex }
    it{ should validate_presence_of :city }
    it{ should validate_presence_of :state }
    it{ should allow_value("foo@bar.com").for :email }
    it{ should_not allow_value("@bar.com").for :email }
    it{ should_not allow_value("foo@bar.").for :email }
  end
end
