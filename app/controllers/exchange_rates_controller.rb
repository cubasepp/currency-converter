class ExchangeRatesController < ApplicationController
  def index
    data = ExchangeRate.where(date: 1.week.ago..).order(date: :desc).all

    @exchange_rates = data.group_by { |rate| (rate[:from_currency] + rate[:to_currency]) }
                          .map { |k,v| [k, v.map { |r| {rate: r.rate, date: r.date }}]}.to_h
  end
end
