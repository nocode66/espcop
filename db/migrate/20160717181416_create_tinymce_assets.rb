class CreateTinymceAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :tinymce_assets do |t|

      t.timestamps
    end
  end
end
