class CreateBooksCategoriesJointTable < ActiveRecord::Migration[5.0]
  def change
    create_table :books_categories, id: false do |t|
      t.integer :book_id
      t.integer :category_id
    end
    
    add_index :books_categories, :book_id
    add_index :books_categories,:category_id
  end
end
