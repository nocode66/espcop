class User < ApplicationRecord
  require "stripe"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :subscription_plan
  
  validates :subscription_plan_id,  presence: true
   
   after_create :create_a_customer

         def create_a_customer
         	token = self.stripe_card_token
         	customer = Stripe::Customer.create(
  				:card => token,
  				:plan =>  self.subscription_plan.stripe_id,
  				:email => self.email
			)       	
         end
end
