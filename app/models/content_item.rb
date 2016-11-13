class ContentItem < ApplicationRecord
  include Naming

  #belongs_to :author, foreign_key: :author_id, primary_key: :id, class_name: 'AdminUser'
  belongs_to :category


  enum status: [:draft, :published]

  delegate :full_name, :email, to: :author, prefix: true

  has_attached_file :image, styles: {thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  validates :slug, uniqueness: true, presence: true, if: ->(a) { a.status == :published }
  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :content, presence: true
  validates :order, presence: true, uniqueness: true 

  before_validation :generate_slug
  before_save :set_defaults


  scope :descending,  lambda { order('created_at DESC') }
  scope :published,   lambda { where(status: 1) }
  scope :unpublished, lambda { where(status: 0)  }
  scope :archived,    lambda { where(archived: true) }
  scope :unarchived,  lambda { where(archived: false) }
  scope :free,        lambda { where(price: 0) }
  scope :paid,        lambda { where.not(price: 0) }
  scope :by_author,   lambda { |author_id| where(author_id: author_id) }
  scope :by_category, lambda { |category_id| where("category_id=?", category_id) }
  scope :recent,      lambda { where("published_date > ?", 1.week.ago) }
  scope :best_of,     lambda { where("best_of = true") }
  scope :featured,    lambda { where("featured = true") }


  def archive
    self.archived = true
  end

  def unarchive
    self.archived = false
  end



  def set_defaults
    self.category = Category.default if category_id.nil?
    previous_feature = ContentItem.find_by(featured: true)
    if self.featured && previous_feature && previous_feature != self
          previous_feature.featured = false
          previous_feature.save
    end
  end


  def initial_category_id
    self.category_id || Category.default_id
  end



  def article_link
    "#{Rails.root} #{self.slug}"
  end

private

  def self.stats(author=nil)
    articles = author.nil? ? self.all : self.where(author_id: author)

    {
      total_articles:       articles.size,
      unarchived_articles:  articles.unarchived.size,
      archived_articles:    articles.archived.size,
      published_articles:   articles.unarchived.published.size,
      unpublished_articles: articles.unarchived.unpublished.size,
    }
  end
end

