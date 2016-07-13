class AddTokensToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :tokens, :integer, default: 1, null: false
  end
end
