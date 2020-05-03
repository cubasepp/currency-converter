class ExchangeRatesController < ApplicationController
  def index
    data = ExchangeRate.where(date: 1.week.ago..Time.now).order(date: :asc).all

    @labels = data.map { |r| r.date }.uniq
    @exchange_rates = data.group_by { |rate| (rate[:from_currency] + rate[:to_currency]) }
                          .map { |k,v| { label: k, data: v.map { |r| r.rate } } }
  end
end
