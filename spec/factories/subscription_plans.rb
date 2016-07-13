FactoryGirl.define do
  factory :subscription_plan do
    amount 1
    interval "month"
    name "MyString"
    currency "eur"
    trial_period_days 0
    id "1"
    statement_descriptor "this is a statement"
  end
end
