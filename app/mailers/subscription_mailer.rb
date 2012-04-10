class SubscriptionMailer < ActionMailer::Base
  default from: "Crowdsourcing Conference<crowdsourcing.conference@gmail.com>"

  def new_subscription(payment)
    send payment, t('action_mailer.subscriptions.new.subject')
  end
  def paid(payment)
    send payment, t('action_mailer.subscriptions.paid.subject')
  end

  def send(payment, subject)
    @payment = payment
    for email in get_emails(@payment)
      mail to: email, subject: subject do |format|
       format.html
     end
    end
  end

  protected
  def get_emails(payment)
    emails = []
    for subscription in payment.subscriptions
      emails << subscription.email
    end
    emails
  end
end
