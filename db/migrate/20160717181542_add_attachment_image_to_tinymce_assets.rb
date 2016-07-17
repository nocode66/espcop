class AddAttachmentImageToTinymceAssets < ActiveRecord::Migration
  def self.up
    change_table :tinymce_assets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tinymce_assets, :image
  end
end
