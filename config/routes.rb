Ccs12::Application.routes.draw do
  filter :locale

  #match 'subscriptions/checkout' => 'subscriptions#checkout', :via => :post
  match "/moip" => "payment_stream#moip", :as => :moip
  match "/thank_you" => "payment_stream#thank_you", :as => :thank_you

  resources :videos, :only => [:show]

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'home#index'

  #get '/coupons/check/:coupon_name' => 'coupons#check_consistency', :as => :check_coupon
end
