class Book < ApplicationRecord
    has_and_belongs_to_many :categories
    has_attached_file :cover, styles: {thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    has_attached_file :file
    accepts_nested_attributes_for :categories
    
    
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
    validates_attachment :file, :content_type => { :content_type => %w(application/pdf) }, presence: true
    validates :title, presence: true, uniqueness: true
    validates :tableOfContents, presence: true
    validates :description, presence: true
end
