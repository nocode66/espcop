Rails.application.routes.draw do

  get 'static/home'
  get '/about', to: 'static#about', as: 'about'
  get '/contact', to: 'static#contact', as: 'contact'
  
  
  resources :subscription_plans, only: [:index]

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  mount StripeEvent::Engine => '/stripe-events'
  
  root to: "static#home"
end
