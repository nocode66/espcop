class AddSlugToContentItem < ActiveRecord::Migration[5.0]
  def change
    add_column :content_items, :slug, :string
  end
end
