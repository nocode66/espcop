class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, index: true
      t.string :subtitle
      t.text :content
      t.integer :status
      t.string :header_img
      t.boolean :featured, default: false
      t.string :icon_img
      t.boolean :commentable, default: false 
      t.string :menu_title

      t.timestamps
    end
  end
end
