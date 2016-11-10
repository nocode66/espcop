class TinymceAsset < ApplicationRecord
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["application/pdf","image/jpg", "image/jpeg", "image/png", "image/gif"]
end
