class SubscriptionPlansController < ApplicationController
  def index
    @plans = SubscriptionPlan.visible
  end
end
