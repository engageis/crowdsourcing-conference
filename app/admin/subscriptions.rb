ActiveAdmin.register Subscription do
  actions :index, :show

  scope :all, default: true
  scope :confirmed
  scope :pending

  index do
    column :name
    column :email
    column "Type", :kind do |t|
      t(t.kind)
    end
    column :company
    column :phone_cell
    column "Payment", :paid do |p|
      status_tag (p.paid ? "Confirmed" : "Pending"), (p.paid ? :ok : :error)
    end
    default_actions
  end

  show do
    attributes_table do
      row :id
      row("Type"){ |s| t(s.kind) }
      row :name
      row :email
      row :birthday
      row :company
      row :role
      row :phone
      row :phone_cell
      row :sex
      row :city
      row :state
      row :created_at
      row :coupon_name
    end
    panel "Payment Details" do
      attributes_table_for subscription.payment do
        row("Payment"){ status_tag (subscription.paid ? "Confirmed" : "Pending"), (subscription.paid ? :ok : :error) }

        if subscription.paid
          payment = subscription.payment
          row(:payment_method) { payment.payment_method.titleize }
          row(:net_amount){ payment.display_net_amount }
          row(:total_amount){ payment.display_total_amount }
          row(:service_tax_amount){ payment.display_service_tax }
          row(:payment_status){ payment.payment_status.titleize }
          row(:institution_of_payment){ payment.institution_of_payment.titleize }
          row :payment_date
        end
        row :service_code
        row :key
        row :payment_token
      end
    end
  end

  sidebar "Related Subscriptions", :only => :show do
    if subscription.payment.subscriptions.size > 1
      table_for subscription.payment.subscriptions do |t|
        t.column("Name"){ |s| link_to s.name, admin_subscription_url(s) }
      end
    end
  end

  filter :kind, label: "Type", :as => :select, collection: Hash[*Subscription::KINDS.map {|v| [I18n.t(v), "#{v}"]}.flatten]
  filter :name
  filter :email
  filter :company
  filter :paid_at
end