class MoneyCurrencylayerBankImporter
  def self.perform
    today = Date.today
    rates = []
    from_currency = 'EUR'

    %W( USD CHF ).each do |to_currency|
      rates << { date: today, rate: Money.default_bank.get_rate(from_currency, to_currency), from_currency: from_currency, to_currency: to_currency }
      # Store reverse currecny exchange rate  required by task
      rates << { date: today, rate: Money.default_bank.get_rate(to_currency, from_currency), from_currency: to_currency, to_currency: from_currency } 
    end

    Rate.create(rates)
  end
end
