class AddFieldsToSubscriptionPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_plans, :stripe_id, :integer, index: true,  null: false
    add_column :subscription_plans, :interval_count, :integer, default: 1, null: false
    add_column :subscription_plans, :metadata, :string
    add_column :subscription_plans, :statement_descriptor, :string
    add_column :subscription_plans, :trial_period_days, :integer, default: 0
    remove_column :subscription_plans, :trial_plan
    
    change_column :subscription_plans, :amount, :integer, null: false
    change_column :subscription_plans, :interval, :string, null: false
    change_column :subscription_plans, :name, :string, null: false
    change_column :subscription_plans, :currency,:string, null: false
  end
end
