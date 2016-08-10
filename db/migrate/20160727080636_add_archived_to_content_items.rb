class AddArchivedToContentItems < ActiveRecord::Migration[5.0]
  def change
    add_column :content_items, :archived, :boolean
  end
end
