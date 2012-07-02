class Subscription < ActiveRecord::Base
  #VALUES = {'subscription.first_day' => 300, 'subscription.second_day' => 300, 'subscription.two_days' => 500}

  #VALUES =  {'subscription.first_day' => 400, 'subscription.second_day' => 400, 'subscription.two_days' => 650}
  VALUES =  {'subscription.first_day' => 740, 'subscription.second_day' => 370, 'subscription.two_days' => 740}

  KINDS = ['subscription.second_day']
  # 'subscription.first_day', 'subscription.second_day',
  belongs_to :payment
  validates :name, :kind, :birthday, :company, :role, :phone, :phone_cell, :sex, :city, :state, :payment, presence: true
  validates :email, presence: true, :format => {:with => Devise.email_regexp}

  before_validation :validate_coupon

  scope :confirmed, where(:paid => true)
  scope :pending, where(:paid => false)

  attr_accessor :add_error

  def paid?
    paid
  end

  def paid!
    update_attribute :paid, true
    update_attribute :paid_at, Time.now
  end

  def total_with_discount
    payment.used_coupons ||= []
    subscription_value = Subscription::VALUES[kind]
    if payment.used_coupons.include?(coupon_name)
      @add_error = true
      return subscription_value
    end

    if coupon_details[:valid]
      payment.used_coupons << coupon_name if Coupon.find_by_name(coupon_name).only_once
    end
    (subscription_value - coupon_details[:value]).abs
  end

  def add_coupon_error
    errors.add :coupon_name, I18n.t('subscription.invalid_coupon')
  end

  def used_coupons
    @@used_coupons
  end

  private

  def validate_coupon
    return true unless coupon_name.present?

    unless coupon_details[:valid]
      coupon_name = nil
      add_coupon_error
    end
    if @add_error
      coupon_name = nil
      add_coupon_error
    end
  end

  def coupon_details
    Coupon.check_for_request coupon_name
  end
end
