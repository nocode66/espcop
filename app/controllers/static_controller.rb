class StaticController < ApplicationController
  def home
    @featured_events=Event.featured
    @featured_content_items = ContentItem.featured
    @espcop_events = Event.espcop.order(date: :desc).limit(4)
    @non_espcop_events =Event.nonespcop.order(date: :desc).limit(4)
  end
  
  def contact
  end
  
  def about
  end

  def board
  end
end
