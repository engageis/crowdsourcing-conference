class HomeController < ApplicationController
  def index
    @payment = Payment.new
    @payment.subscriptions.build kind: Subscription::KINDS.first
    index_page
  end
end
