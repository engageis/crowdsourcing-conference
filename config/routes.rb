Ccs12::Application.routes.draw do
  filter :locale

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'home#index'
end
