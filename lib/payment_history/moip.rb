module PaymentHistory
  class Moip
    attr_accessor :params, :response_code, :payment

    def initialize(post_params)
      @params = post_params
    end

    def process_request!
      begin
        @payment = Payment.find_by_key @params[:id_transacao]
        @payment.update_from_service
        puts '----1) update_from_service'
        puts "----2) #{@payment.moip_value} -------- #{@params[:valor].to_s}"
        puts "----3) #{@params[:status_pagamento].to_i} ---- #{TransactionStatus::AUTHORIZED}"
        
        if @payment.moip_value == @params[:valor].to_s
          @response_code = ResponseCode::SUCCESS
          if @params[:status_pagamento].to_i == TransactionStatus::AUTHORIZED
            for subscription in @payment.subscriptions
              subscription.paid! unless subscription.paid
            end
            SubscriptionMailer.paid(@payment).deliver
          end
        else
          @response_code = ResponseCode::NOT_PROCESSED
        end
      rescue
        @response_code = ResponseCode::NOT_PROCESSED
      end
      puts "---------- last here"
      self
    end

    class ResponseCode < EnumerateIt::Base
      associate_values(
        :not_processed => 422,
        :success => 200
      )
    end

    #MoIP API table:
    class PaymentMethods < EnumerateIt::Base
      associate_values(
        :DebitoBancario         => 1,
        :FinanciamentoBancario  => 2,
        :BoletoBancario         => 3,
        :CartaoDeCredito        => 4,
        :CartaoDeDebito         => 5,
        :CarteiraMoIP           => 6,
        :NaoDefinida            => 7
      )
    end

    class TransactionStatus < EnumerateIt::Base
      associate_values(
        :authorized =>      1,
        :started =>         2,
        :printed_boleto =>  3,
        :finished =>        4,
        :canceled =>        5,
        :process =>         6,
        :written_back =>    7
      )
    end
  end
end