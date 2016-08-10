ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :bio, :first_name, :last_name, :title

  index do
    selectable_column
    id_column
    column :email
    column :title
    column :full_name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :title
  filter :full_name


  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :bio
    end
    f.actions
  end

end
