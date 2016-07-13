class Category < ApplicationRecord
  has_and_belongs_to_many :books
  has_attached_file :image, styles: {thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  
  before_save :set_default, if: :default?
  before_destroy :check_destroy_prerequisites

  def empty?
    self.books.count == 0
  end

  def self.default_id
    if default = self.default
      default.id
    end
  end
  
  private
    
  def check_destroy_prerequisites
    raise ( "Cannot delete category with assigned books.") unless books.empty?
    raise ( "Cannot delete default category.") if default?
    
  end


  def self.default
    self.find_by(default: true)
  end
  
  protected
  
  def set_default
    previous_default = Category.find_by(default: true)

    if previous_default and previous_default != self
      previous_default.update(default: false)
    end
  end  
end
