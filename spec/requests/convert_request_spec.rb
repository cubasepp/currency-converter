require 'rails_helper'

#
RSpec.describe "/convert", type: :request do
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
    it "renders a successful response" do
      Timecop.freeze(new_time)

      allow(Money).to receive(:new).and_return(Money.new(200, 'EUR'))

      get convert_url, params: { cents: '100', from_currency: 'EUR', to_currency: 'USD', format: :json}

      expect(response).to be_successful
      expect(response.body).to eq('{"converted_amount":2.0,"exchange_rates":[{"date":"2020-01-01","rate":1.085193082979289},{"date":"2019-12-31","rate":1.085193082979289},{"date":"2019-12-30","rate":1.085193082979289},{"date":"2019-12-29","rate":1.085193082979289},{"date":"2019-12-28","rate":1.085193082979289},{"date":"2019-12-27","rate":1.085193082979289},{"date":"2019-12-26","rate":1.085193082979289}]}')

      Timecop.return
    end

    it "renders a successful response without rates" do
      allow(Money).to receive(:new).and_return(Money.new(200, 'EUR'))

      get convert_url, params: { cents: '100', from_currency: 'EUR', to_currency: 'CHF', format: :json}

      expect(response).to be_successful
      expect(response.body).to eq('{"converted_amount":2.0,"exchange_rates":[]}')
    end

    it "renders a bad request" do
      get convert_url, params: { amount: '100', to_currency: 'CHF', format: :json}

      expect(response.status).to eq 400
    end
  end
end
