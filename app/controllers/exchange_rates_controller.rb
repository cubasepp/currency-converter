class ExchangeRatesController < ApplicationController
  def index
    data = ExchangeRate.where(date: 1.week.ago..Time.now).order(date: :asc).all

    @labels = data.map { |rates| rates.date }.uniq
    @exchange_rates = data.group_by { |currency| (currency[:from_currency] + currency[:to_currency]) }
                          .map { |key, value| { label: key, data: value.map { |r| r.rate } } }
  end
end
