ActiveAdmin.register ContentItem do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :title, :subtitle, :menu_title, :category_id, :image, :featured, :commentable, :content, :visible

form do |f|
  f.inputs "Basic info" do
    f.input :title
    f.input :subtitle
    f.input :menu_title
    f.input :featured
    f.input :commentable
    f.input :visible
    f.input :category, collection: Category.all, allow_blank: false, include_blank: false
    f.input :image, hint: f.content_item.image? ? image_tag(f.image.image.url(:thumb), height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")

    f.input :content, :input_html => { :class => "tinymce" }
  end
  f.actions
end

end
