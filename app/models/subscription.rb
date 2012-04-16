class Subscription < ActiveRecord::Base
  VALUES = {'subscription.first_day' => 300, 'subscription.second_day' => 300, 'subscription.two_days' => 500}

  #VALUES =  {'subscription.first_day' => 400, 'subscription.second_day' => 400, 'subscription.two_days' => 650}
  #VALUES =  {'subscription.first_day' => 740, 'subscription.second_day' => 740, 'subscription.two_days' => 740}

  KINDS = ['subscription.two_days']
  # 'subscription.first_day', 'subscription.second_day',
  belongs_to :payment
  validates :name, :kind, :birthday, :company, :role, :phone, :phone_cell, :sex, :city, :state, :payment, presence: true
  validates :email, presence: true, :format => {:with => Devise.email_regexp}

  before_validation :validate_coupon

  scope :confirmed, where(:paid => true)
  scope :pending, where(:paid => false)

  def paid?
    paid
  end

  def paid!
    update_attribute :paid, true
    update_attribute :paid_at, Time.now
  end

  def total_with_discount
    (Subscription::VALUES[kind] - coupon_details[:value]).abs
  end

  private

  def validate_coupon
    coupon_name = nil unless coupon_details[:valid]
  end

  def coupon_details
    Coupon.check_for_request coupon_name
  end

  #subscription.coupon_name = nil unless valid_coupon?(subscription)
  #Subscription::VALUES[subscription.kind]
end
