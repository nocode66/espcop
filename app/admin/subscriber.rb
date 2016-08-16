ActiveAdmin.register Subscriber do

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


  config.comments = false
  before_filter do @skip_sidebar = true end
  # menu false
  config.clear_action_items!   # this will prevent the 'new button' showing up


controller do
    def index
      gibbon = Gibbon::Request.new
      gibbon.lists(list_id).members.retrieve(params: {"count": "50"})
      render 'admin/subscriber/index', :layout => 'active_admin'
    end

    def update
      gibbon.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: "foo@bar.com", status: "subscribed", merge_fields: {FNAME: "First Name", LNAME: "Last Name"}})
    end

    def delete
      gibbon.lists(list_id).members(lower_case_md5_hashed_email_address).update(body: { status: "unsubscribed" })
    end

    def create
      gibbon.lists(list_id).members.create(body: {email_address: "foo@bar.com", status: "subscribed", merge_fields: {FNAME: "First Name", LNAME: "Last Name"}})
    end

    def show
      gibbon.lists(list_id).members(lower_case_md5_hashed_email_address).retrieve
    end
  end
end
