ActiveAdmin.register ContentItem do
 
 config.sort_order = 'order_desc'
 
scope :all, default: true
scope ("Visible") { |scope| scope.where(visible: true) }
scope ("Inactive") { |scope| scope.where(visible: false) }
scope ("Featured") { |scope| scope.where(featured: true) }
scope ("Commentable") { |scope| scope.where(commentable: true) }




 filter :title
 filter :category
 filter :visible
 filter :featured
 filter :order
 filter :commentable
 filter :author


permit_params :title, :subtitle, :menu_title, :category_id, :image, :featured, :commentable, :content, :visible, :order


index do |ci|
  column :order
  column :visible do |item|
    status_tag('Default', :ok) if item.visible?
  end
  column :title
  column :author
  column :category
  column :featured
  column :commentable

  actions
end



form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Basic info" do
    f.input :title
    f.input :subtitle
    f.input :menu_title
    f.input :order
    f.input :featured
    f.input :commentable
    f.input :visible
    f.input :category, collection: Category.all, allow_blank: false, include_blank: false
    f.input :image, hint: f.content_item.image? ? image_tag(f.content_item.image.url(:thumb), height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")

    f.input :content, :input_html => { :class => "tinymce" }
  end
  f.actions
end

end
