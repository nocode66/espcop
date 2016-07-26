class RenameTableArticleToContentItems < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :articles, :content_items
  end 
  def self.down
    rename_table :content_items, :articles
  end

end
