ActiveAdmin.register Category do

filter :name
filter :description

controller do   
    def destroy
        category = Category.find(params['id'])
        if category.default? 
            flash[:error] = "Can't delete the default category"
        elsif !category.empty?
           flash[:error] = "Could not delete category. There are still books associated to it."
        else   
            category.destroy!
        end
        redirect_to collection_url
    end
end
  
  
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name,:image, :cover, :description, :default
#
#
index do |category|
    id_column
  column :cover do |item|
      image_tag(item.image.url(:thumb)) if item.image?
  end
  column :name
  column :default do |item|
   status_tag('Default', :ok) if item.default?
  end
  column :number_of_articles, sortable: true do |item|
      item.content_items.size
  end
  
  actions
end

show do |category|
    attributes_table do
        row :name
        row :image do
          category.image? ? image_tag(category.image.url(:thumb)) : content_tag(:span, "No image yet")
        end
        row :default do |item|
          item.default? ?  status_tag('Default', :ok) : status_tag('Not the default category', :warn)
        end 
        row :description do
          simple_format category.description      
        end
    end
end

form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
       f.input :name
       f.input :image, hint: f.category.image? ? image_tag(f.category.image.url(:thumb), height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
       f.input :default if !category.default?
       f.input :description, :input_html => { :class => "tinymce" }
    end
    f.actions
    end

end
