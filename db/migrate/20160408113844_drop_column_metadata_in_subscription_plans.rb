class DropColumnMetadataInSubscriptionPlans < ActiveRecord::Migration[5.0]
  def change
    remove_column :subscription_plans,  :metadata
  end
end
