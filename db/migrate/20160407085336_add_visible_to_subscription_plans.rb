class AddVisibleToSubscriptionPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_plans, :visible, :boolean, default: false, null: false 
  end
end
