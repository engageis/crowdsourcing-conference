class PaymentStreamController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:moip]

  # this action receive a post request from moip service.
  def moip
    moip_request = PaymentHistory::Moip.new(params).process_request!
    return render :nothing => true, :status => moip_request.response_code
  end

  def thank_you
    if session[:_payment_token]
      @payment = Payment.find_by_payment_token session[:_payment_token]
      session[:_payment_token] = nil
      if @payment
        @payment.update_from_service
      else
        redirect_to :root
      end  
    else
      redirect_to :root
    end
  end
end
