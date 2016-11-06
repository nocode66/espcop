ActiveAdmin.register Event do
  
  config.sort_order = 'date_desc'
  permit_params :title, :location, :date, :price,:description, :espcop, :registration, :url, :featured, :featured_order, :image, :content, :currency



  form do |f|
    f.inputs "Event Registration" do
      f.input :title, include_blank: false
      f.input :location, include_blank: false
      f.input :date, include_blank: false
      f.input :url, include_blank: false
       f.input :image, hint: f.event.image? ? image_tag(f.event.image.url(:thumb), height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
      f.input :content
      f.input :description
      f.input :espcop, :as => :select, collection: [true, false], include_blank: false
      f.input :registration, :as => :select, collection: [true, false], include_blank: false
      f.input :price
      f.input :currency, as: :select, collection: ["usd","eur"], include_blank: false
      f.input :featured, :as => :select, collection: [true, false], include_blank: false
      f.input :featured_order
      
    end
    f.actions
  end


end
