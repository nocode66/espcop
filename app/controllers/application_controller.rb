class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_menu


  protected

  def configure_permitted_parameters
  	#This allows the attributes to be accessible at sign up. I had to add email and password after adding token. 
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :stripe_card_token, :email, :password, :password_confirmation, :subscription_plan_id) }
  	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :stripe_card_token) }
  end


  private

  def set_menu
    @categories_menu = Category.all.select{ |r| r.has_published_articles? } 
  end
end
