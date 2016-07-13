# config/initializers/stripe.rb
#todo remove the key info from this file and have env variable
#todo recreate new API keys when do that

Rails.configuration.stripe = {
    publishable_key: ENV['TEST_MY_PUBLISHABLE_KEY'],
    secret_key:      ENV['TEST_MY_SECRET_KEY']
}


Stripe.api_key = Rails.configuration.stripe[:secret_key]
