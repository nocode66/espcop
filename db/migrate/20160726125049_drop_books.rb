class DropBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :books_id
    drop_table :books
  end
end
