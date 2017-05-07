class CardsController < ApplicationController
  before_action :authenticate_user!
  def update
    customer=Stripe::Customer.retrieve(current_user.stripe_id)
    card=customer.sources.retrieve(customer['sources']['data'].first['id']).delete
    customer.sources.create(source: params['stripe_card_token'])
    customer=Stripe::Customer.retrieve(current_user.stripe_id)
    stripe_customer_params = JSON.parse customer.to_s
    current_user.card_last4= stripe_customer_params['sources']['data'].first['last4']
    current_user.card_type=stripe_customer_params['sources']['data'].first['brand']
    current_user.card_exp_month=stripe_customer_params['sources']['data'].first['exp_month']
    current_user.card_exp_year=stripe_customer_params['sources']['data'].first['exp_year']
    current_user.save!
    redirect_to edit_user_registration_path, notice:"Successfully updated your card!"
  end
end