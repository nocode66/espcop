class CreateNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletters do |t|
      t.date :date
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
