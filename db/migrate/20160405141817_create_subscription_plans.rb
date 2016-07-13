class CreateSubscriptionPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_plans do |t|
      t.integer :amount
      t.string :interval
      t.string :name
      t.string :currency, default: 'usd'
      t.boolean :trial_plan

      t.timestamps
    end
  end
end
