Rails.application.routes.draw do

  resources :newsletters
  get 'static/home'
  get '/about', to: 'static#about', as: 'about'
  get '/contact', to: 'static#contact', as: 'contact'
  get '/board', to: 'static#board', as: 'board'
  
  
  resources :subscription_plans, only: [:index]
  resources :content_items, only: [:show], path: 'articles'
  resources :category, only: [:show]
  resources :newsletters, only: [:index]
  
  get '/past-events', to: 'events#past'
  get '/events', to: 'events#future'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  mount StripeEvent::Engine => '/stripe-events'
  
  root to: "static#home"
  post '/tinymce_assets' => 'tinymce_assets#create'
end
