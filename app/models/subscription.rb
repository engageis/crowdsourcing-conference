class Subscription < ActiveRecord::Base
  KINDS = ['subscription.first_day', 'subscription.second_day', 'subscription.two_days']
  belongs_to :payment
  validates :name, :kind, :birthday, :company, :role, :phone, :phone_cell, :sex, :city, :state, :payment, presence: true
  validates :email, presence: true, :format => {:with => Devise.email_regexp}

  scope :confirmed, where(:paid => true)
  scope :pending, where(:paid => false)

  def paid?
    paid
  end

  def paid!
    update_attribute :paid, true
    update_attribute :paid_at, Time.now
  end
end
