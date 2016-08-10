class AddOrderToContentItems < ActiveRecord::Migration[5.0]
  def change
    add_column :content_items, :order, :integer
  end
end
