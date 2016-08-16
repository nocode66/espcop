class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.date :date
      t.text :content
      t.integer :price, default: 0
      t.boolean :espcop, default: false
      t.boolean :registration, default: false
      t.string :url
      t.boolean :featured, default: false
      t.integer :featured_order, default: 0

      t.timestamps
    end
  end
end
