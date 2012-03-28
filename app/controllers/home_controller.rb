class HomeController < ApplicationController
  def index
    @payment = Payment.new
    @payment.subscriptions.build kind: Subscription::KINDS.first
  end
end
