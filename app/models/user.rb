class User < ApplicationRecord
  require "stripe"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :subscription_plan
  
  validates :subscription_plan,  presence: true
   
   after_create :create_a_customer

         def create_a_customer
         	token = self.stripe_card_token
         	customer = Stripe::Customer.create(
  				:card => token,
  				:plan =>  self.subscription_plan.stripe_id,
  				:email => self.email
			)       	
          stripe_customer_params = JSON.parse customer.to_s
          self.stripe_id=stripe_customer_params['id']
          self.card_last4= stripe_customer_params['sources']['data'].first['last4']
          self.card_type=stripe_customer_params['sources']['data'].first['brand']
          self.card_exp_month=stripe_customer_params['sources']['data'].first['exp_month']
          self.card_exp_year=stripe_customer_params['sources']['data'].first['exp_year']
          self.save
         end
end
