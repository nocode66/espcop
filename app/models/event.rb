class Event < ApplicationRecord
  has_attached_file :image, styles: {thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :featured,     lambda { where("featured = true") }
  scope :espcop,     lambda { where("espcop= true") }
  scope :nonespcop,     lambda { where("espcop = false") }
  scope :upcoming,  lambda { where("date >= ?", Time.now ).order(date: :asc) }
end
