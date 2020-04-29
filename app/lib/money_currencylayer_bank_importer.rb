class MoneyCurrencylayerBankImporter
  def self.perform
    today = Date.today
    rates = []
    source_currency = 'EUR'

    %W( USD CHF ).each do |currency|
      rates << { date: today, rate: Money.default_bank.get_rate(source_currency, currency), from_currency: source_currency, to_currency: currency }
      # Store reverse currecny exchange rate  required by task
      rates << { date: today, rate: Money.default_bank.get_rate(currency, source_currency), from_currency: currency, to_currency: source_currency } 
    end

    Rate.create(rates)
  end
end
