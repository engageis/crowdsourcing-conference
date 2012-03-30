Ccs12::Application.routes.draw do
  #filter :locale

  match 'subscriptions/checkout' => 'subscriptions#checkout', :via => :post
  match "/moip" => "payment_stream#moip", :as => :moip
  match "/thank_you" => "payment_stream#thank_you", :as => :thank_you

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'home#index'
end
