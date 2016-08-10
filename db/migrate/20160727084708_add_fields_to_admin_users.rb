class AddFieldsToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :string, :string
    add_column :admin_users, :last_name, :string
    add_column :admin_users, :title, :string
    add_column :admin_users, :bio, :text
  end
end
