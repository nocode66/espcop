class ContentItem
  module Naming
    extend ActiveSupport::Concern

    def generate_slug
      title = ActionView::Base.full_sanitizer.sanitize(self.title)

      if title.present?
        title = title.parameterize
      else
        begin
          title = SecureRandom.hex(5) 
        end while self.class.exists?(slug: title)
      end

      self.slug = title
    end

    def has_header?
      header.present?
    end

    def header
      header_img.url
    end

  end
end