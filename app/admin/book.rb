ActiveAdmin.register Book do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :authors,:file, :cover, :tableOfContents, :description, :tokens, category_ids: [], categories_attributes: [:id, :name, :default, :description, :_update,:_create]

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


filter :title
filter :authors
filter :categories, as: :select
filter :tokens


index do |book|
  id_column
  column :cover do |item|
      image_tag(item.cover.url(:thumb)) if item.cover?
  end
  column :title do  |item|
      link_to(item.title, item.file.url, target: "_blank")  if item.file?
  end
  column :authors
  column :tokens
  actions
end

show do |book|
    attributes_table do
        row :title
        row :authors
        row :file do
            book.file? ? link_to(book.file_file_name, book.file.url) : content_tag(:span, "No instruction file yet")
        end
        row :photo do
          book.cover? ? image_tag(book.cover.url(:thumb)) : content_tag(:span, "No cover yet")
        end
        row :categories do
            table_for book.categories do
                column :name
            end 
        end
        row :tokens
        row :tableOfContents, label: "Table of Contents" do
          simple_format book.tableOfContents
        end
      row :description do
        simple_format book.description      
      end
    end
end

form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
       f.input :title
       f.input :authors
       f.input :file, hint: f.book.file? ? link_to(f.book.file, f.book.file.url) : content_tag(:span, "Upload PDF file")
       f.input :cover, hint: f.book.cover? ? image_tag(f.book.cover.url(:thumb), height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
       f.input :categories, as: :check_boxes, collection: Category.all
       f.input :tokens
       f.input :tableOfContents, label: "Table of Contents", as: :html_editor
       f.input :description, as: :html_editor
   end
    f.actions
end
end
