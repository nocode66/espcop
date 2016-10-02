class AddCurrencyToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :currency,:string
  end
end
