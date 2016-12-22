class ContentItemsController < ApplicationController

  def show
    @content_item = ContentItem.find(params[:id])
  end
end

