class AddTokensToSubscriptionPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_plans, :tokens, :integer, default: 20, null: false 
  end
end
