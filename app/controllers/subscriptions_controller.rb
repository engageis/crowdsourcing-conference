#Encoding: UTF-8
class SubscriptionsController < ApplicationController
  def checkout
    @payment = Payment.new params[:payment]

    total = 0
    names = []

    for subscription in @payment.subscriptions
      subscription.payment = @payment
      total += subscription.total_with_discount
      names << subscription.name.split(' ').first
    end

    if @payment.subscriptions.first.valid?
      @payment.fill_payer_details
    end

    @payment.total = ("%0.0f" % total)
    if @payment.save
      SubscriptionMailer.new_subscription(@payment).deliver
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
           :razao => "#{t('subscription.checkout.message')} (#{names.join(', ')})",
           :forma => "BoletoBancario",
           :dias_expiracao => 2,
           :pagador => payer,
           :url_retorno => thank_you_url
         }

        response = MoIP::Client.checkout(payment_data)
        #response["Status"] == "Sucesso"

        @payment.update_attribute :payment_token, response["Token"]
        @payment.disable_all_once_time_coupons
        session[:_payment_token] = response["Token"]
        redirect_to MoIP::Client.moip_page(response["Token"])
      rescue
        flash[:failure] = t('subscription.checkout.moip_error')
        return redirect_to :root
      end
    else
      index_page
      render "home/index"
    end
  end
end
