class SubscriptionPlan < ApplicationRecord
    has_paper_trail
    require "stripe"
    
    validates :name, :stripe_id, :amount, :interval_count, :statement_descriptor, :tokens, presence: true
    validates :name, :stripe_id, uniqueness: true
    validates :currency, inclusion: { in: %w(usd eur),  message: "%{value} is not a valid currency" }
    validates :interval, inclusion: { in: %w(day week month year),  message: "%{value} is not a day/month/year" }
    validates :visible, :inclusion => { :in => [true, false] }  
    
    has_many :users
    
     scope :visible, -> { where(visible: true) }
    
    
    before_validation(on: :create) do
        self.stripe_id = SecureRandom.uuid  
    end
    
    before_create  :stripe_create
    before_update  :stripe_update
    before_destroy :stripe_destroy
    
    private
    
    def stripe_create
       
       raise ( "Cannot register plan with stripe") unless Stripe::Plan.create(
          amount: (self.amount*100).to_i,
          interval:  self.interval,
          name: self.name,
          currency: self.currency,
          id: self.stripe_id,
          metadata: {tokens:self.tokens},
          statement_descriptor: self.statement_descriptor,
          trial_period_days: self.trial_period_days,
          interval_count: self.interval_count
        ) 
    end
    
    
    def stripe_update
        stripe_plan = Stripe::Plan.retrieve(self.stripe_id)
        stripe_plan.name = self.name
        stripe_plan.statement_descriptor = self.statement_descriptor
        stripe_plan.metadata = {tokens:self.tokens}
        stripe_plan.save
    end
    
    
    def stripe_destroy
        stripe_plan = Stripe::Plan.retrieve(self.stripe_id)
        stripe_plan.delete
    end
end
