class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @content_items=@category.content_items
    @articles=ContentItem.all
  end
end

