class EmailapiController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :subscribe
  def subscribe
   begin 
     gb = Gibbon::Request.new() 
     gb.lists('6586f844ec').members.create(body: {email_address: params[:email][:address], status: "subscribed"})
     flash.now[:success] = "Thank you for submitting your email!"
     redirect_back fallback_location: root_path
   rescue Exception => e
    redirect_back fallback_location: root_path
   end 
    
end
end

