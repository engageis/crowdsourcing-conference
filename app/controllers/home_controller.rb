class HomeController < ApplicationController
  def index
    @payment = Payment.new
    @payment.subscriptions.build
  end
end
