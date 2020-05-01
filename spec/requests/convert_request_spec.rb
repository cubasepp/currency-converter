require 'rails_helper'

#
RSpec.describe "/convert", type: :request do
  let!(:exchange_rate) {
    FactoryBot.create_list(:exchange_rate, 10) do |r, i|
      r.date = i.days.ago
    end
  }

  describe "GET /index" do
    it "renders a successful response" do
      allow(Money).to receive(:new).and_return(Money.new(2, 'EUR'))

      get convert_url, params: { amount: '1.0', from_currency: 'EUR', to_currency: 'USD', format: :json}

      expect(response).to be_successful
      expect(response.body).to eq('{"converted_amount":0.02,"exchange_rates":[{"date":"2020-04-29","rate":1.085193082979289},{"date":"2020-04-29","rate":1.085193082979289},{"date":"2020-04-29","rate":1.085193082979289},{"date":"2020-04-29","rate":1.085193082979289},{"date":"2020-04-29","rate":1.085193082979289},{"date":"2020-04-29","rate":1.085193082979289},{"date":"2020-04-29","rate":1.085193082979289}]}')
    end

    it "renders a successful response without rates" do
      allow(Money).to receive(:new).and_return(Money.new(2, 'EUR'))

      get convert_url, params: { amount: '1.0', from_currency: 'EUR', to_currency: 'CHF', format: :json}

      expect(response).to be_successful
      expect(response.body).to eq('{"converted_amount":0.02,"exchange_rates":[]}')
    end

    it "renders a bad request" do
      allow(Money).to receive(:new).and_return(Money.new(2, 'EUR'))

      get convert_url, params: { amount: '1.0', to_currency: 'CHF', format: :json}

      expect(response.status).to eq 400
    end
  end
end
