class NewslettersController < ApplicationController
  def index 
    @newsletters = Newsletter.all.order(date: :desc).group_by { |m| m.date.year }
  end
end
