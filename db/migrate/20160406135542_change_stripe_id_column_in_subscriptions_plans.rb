class ChangeStripeIdColumnInSubscriptionsPlans < ActiveRecord::Migration[5.0]
  def change
    change_column :subscription_plans, :stripe_id, :string, null: false
  end
end
