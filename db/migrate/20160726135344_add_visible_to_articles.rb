class AddVisibleToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :content_items, :visible, :boolean, default: false
  end
end
