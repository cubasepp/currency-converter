# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

exchange_rates = []
source_currency = Rails.configuration.x.default_currency 
(1.week.ago.to_date..DateTime.now.to_date).each do |today|
  Rails.configuration.x.allowed_currencies.each do |currency|
    exchange_rates << { date: today, rate: rand(1.080..1.099), from_currency: source_currency, to_currency: currency }
    exchange_rates << { date: today, rate: rand(1.080..1.099), from_currency: currency, to_currency: source_currency }
  end
end

ExchangeRate.create(exchange_rates)
