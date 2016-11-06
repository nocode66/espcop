class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @upcoming_events=Event.upcoming.limit(5)
  end
end

