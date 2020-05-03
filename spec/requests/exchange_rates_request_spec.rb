require 'rails_helper'

RSpec.describe "ExchangeRates", type: :request do
  new_time = Time.local(2020, 1, 1, 12, 0, 0)

  let!(:exchange_rate) {
    Timecop.travel(new_time) do
      create_list(:exchange_rate, 20) do |r, i|
        r.date = i.days.ago.to_date
        r.save()
      end
    end
  }

  describe "GET /index" do

    it "returns http success with data found" do
      Timecop.freeze(new_time)

      headers = { "ACCEPT" => "application/json" }
      get exchange_rates_url, headers: headers

      expect(response).to have_http_status(:success)
      expect(response.body).to eq('{"labels":["2019-12-25","2019-12-26","2019-12-27","2019-12-28","2019-12-29","2019-12-30","2019-12-31","2020-01-01"],"data":[{"label":"EURUSD","data":[1.085193082979289,1.085193082979289,1.085193082979289,1.085193082979289,1.085193082979289,1.085193082979289,1.085193082979289,1.085193082979289]}]}')

      Timecop.return
    end

    it "returns http success without data" do
      headers = { "ACCEPT" => "application/json" }

      get exchange_rates_url, headers: headers

      expect(response).to have_http_status(:success)
      expect(response.body).to eq('{"labels":[],"data":[]}')
    end
  end

end
