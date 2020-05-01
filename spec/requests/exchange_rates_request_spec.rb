require 'rails_helper'

RSpec.describe "ExchangeRates", type: :request do

  let!(:exchange_rate) {
    FactoryBot.create_list(:exchange_rate, 20) do |r, i|
      r.date = i.days.ago
    end
  }

  describe "GET /index" do
    it "returns http success with data found" do

      headers = { "ACCEPT" => "application/json" }
      get exchange_rates_url, headers: headers

      expect(response).to have_http_status(:success)
      expect(response.body).to eq('{"EURUSD":[{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"},{"rate":1.085193082979289,"date":"2020-04-29"}]}')
    end

    it "returns http success without data" do
      headers = { "ACCEPT" => "application/json" }
      Timecop.travel(2.weeks.from_now) do
        get exchange_rates_url, headers: headers

        expect(response).to have_http_status(:success)
        expect(response.body).to eq('{}')
      end
    end
  end

end
