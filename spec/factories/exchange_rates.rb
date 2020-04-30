FactoryBot.define do
  factory :exchange_rate do
    date { "2020-04-29" }
    rate { 1.085193082979289 }
    from_currency { "EUR" }
    to_currency { "USD" }
  end
end
