class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    @tiny = TinymceAsset.create!(image: params[:file])

    render json: {
      image: {
        url: @tiny.image.url
      }
    }, content_type: "text/html"
  end
end


