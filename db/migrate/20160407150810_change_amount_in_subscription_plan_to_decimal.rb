class ChangeAmountInSubscriptionPlanToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :subscription_plans, :amount, :decimal, :precision => 8, :scale => 2
  end
end
