class UsersController < ApplicationController
  def profile
    @featured_events=Event.featured
    @featured_content_items = ContentItem.featured
    @espcop_events = Event.espcop.order(date: :desc).limit(4)
    @non_espcop_events =Event.nonespcop.order(date: :desc).limit(4)
  end
  
 
end
