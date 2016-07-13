class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :authors
      t.text :tableOfContents

      t.timestamps
    end
  end
end
