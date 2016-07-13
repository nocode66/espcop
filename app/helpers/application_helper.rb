module ApplicationHelper
    def currency_sign(currency)
        currency == 'eur' ? '&euro;' : '$'
    end
end
