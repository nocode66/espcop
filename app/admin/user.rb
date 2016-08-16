ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :subscription_plan_id, :title
  index do
    selectable_column
    id_column
    column :email
    column :title
    column :full_name
    column :subscription_plan
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
    column :stripe_card_token
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :title
  filter :full_name
  filter :subscription_plan


  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :subscription_plan
    end
    f.actions
  end

end







