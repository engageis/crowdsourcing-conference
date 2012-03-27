#Encoding: UTF-8
class SubscriptionsController < ApplicationController
  def checkout    
    @payment = Payment.new params[:payment]
    
    for subscription in @payment.subscriptions
      subscription.payment = @payment
    end

    if @payment.subscriptions.first.valid? 
      @payment.fill_payer_details
    end

    @payment.total = params[:payment][:total]
    
    if @payment.save
      begin
        payer = {
           :nome => @payment.payer_name,
           :email => @payment.payer_email,
           :cidade => @payment.city,
           :estado => @payment.state,
           :pais => "BRA",
           :tel_fixo => @payment.subscriptions.first.phone,
           :tel_cel => @payment.subscriptions.first.phone_cell
         }
         payment_data = {
           :valor => "%0.0f" % (@payment.total),
           :id_proprio => @payment.key,
           :razao => "Inscrição no CCS12",
           :forma => "BoletoBancario",
           :dias_expiracao => 2,
           :pagador => payer,
           :url_retorno => thank_you_url
         }

        response = MoIP::Client.checkout(payment_data)
        @payment.update_attribute :payment_token, response["Token"]
        session[:_payment_token] = response["Token"]
        redirect_to MoIP::Client.moip_page(response["Token"])
      rescue
        flash[:failure] = t('subscriptions.checkout.moip_error')
        return redirect_to :root
      end
    else
      render "home/index"
    end
  end
end
