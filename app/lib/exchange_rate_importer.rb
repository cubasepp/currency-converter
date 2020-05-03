class ExchangeRateImporter
  def self.perform
    today = Date.today
    exchange_rates = []
    source_currency = Rails.configuration.x.default_currency

    Rails.configuration.x.allowed_currencies.each do |currency|
      exchange_rates << { date: today, rate: Money.default_bank.get_rate(source_currency, currency), from_currency: source_currency, to_currency: currency }
      # Store reverse exchange rate required by task
      exchange_rates << { date: today, rate: Money.default_bank.get_rate(currency, source_currency), from_currency: currency, to_currency: source_currency }
    end

    ExchangeRate.create(exchange_rates)
  end
end
