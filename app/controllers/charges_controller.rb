class ChargesController < ApplicationController

def new
end

def create
  @event = Event.find(params[:event_id])
  # Amount in cents
  @amount = params[:amount]
  @currency =params[:currency]
  @description = params[:description]

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => @description,
    :currency    => @currency
  )

flash[:success] = "You are now registered for this event. Thank for registering! "
redirect_to event_path(@event)
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to event_path(@event)
end

end
