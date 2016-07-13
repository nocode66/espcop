ActiveAdmin.register SubscriptionPlan do
  menu  priority: 11
  permit_params :name, :amount, :interval, :stripe_id, :currency, :visible, :trial_period_days, :interval_count, :tokens, :statement_descriptor
  
  
  filter :name
  filter :amount
  filter :currency, as: :select, collection: ["usd","eur"], include_blank: false
  filter :visible
  filter :interval, as: :select, collection: ["day","week","month","year"], include_blank: false
  filter :tokens
  filter :trial_period_days

  index do
    selectable_column
    column :name
    column :amount 
    column :currency 
    column :interval do |item|
      pluralize(item.interval_count, item.interval)
    end
    column :visible do |item|
     status_tag(item.visible)
    end
    actions
  end

  form do |f|
    f.inputs "Subscription Plan" do
      f.input :name
      f.input :statement_descriptor, include_blank: false
      f.input :visible, :as => :select, collection: [true, false], include_blank: false
      f.input :tokens
     
      if f.object.new_record?
        f.input :amount
        f.input :interval_count
        f.input :interval, as: :select, collection: ["day","week","month","year"], include_blank: false
        f.input :currency, as: :select, collection: ["usd","eur"], include_blank: false
        f.input :trial_period_days
      end
    end
    f.actions
  end
end