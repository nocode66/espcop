class DropColumnsFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :header_img
    remove_column :articles, :icon_img
  end
end
