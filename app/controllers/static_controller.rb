class StaticController < ApplicationController
  def home
    @featured_events=Event.featured.order(:featured_order)
    @featured_content_items = ContentItem.featured.order(:order)
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
