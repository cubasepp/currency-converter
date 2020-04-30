require "rails_helper"

RSpec.describe MoneyCurrencylayerBankImporter do

  describe 'perform' do
    it 'Should create two entries' do
      allow(Money).to receive_message_chain(:default_bank, :get_rate) {'1.0557460338094387'}

      expect {
        described_class.perform
      }.to change(ExchangeRate, :count).by(4)
    end
  end
end
