ActiveAdmin::Dashboards.build do
  section "Recent Subscriptions" do
    table do
      thead
        tr
          th :name
          th :email
          th :payment
          th "Created at"
      tbody
        Subscription.order('created_at desc').limit(10).collect do |subscription|
          tr
            td link_to(subscription.name, admin_subscription_path(subscription))
            td mail_to(subscription.email)
            td { status_tag (subscription.paid ? "Confirmed" : "Pending"), (subscription.paid ? :ok : :error) }
            td subscription.created_at.strftime(t('time.formats.long'))
        end
    end
  end
end
