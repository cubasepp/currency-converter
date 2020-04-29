CURRENCYLAYER_BANK_CONFIG = YAML.safe_load(File.read(Rails.root.join('config', 'currency_layer_bank.yml')))[Rails.env]
require 'money/bank/currencylayer_bank'

MoneyRails.configure do |config|
  mclb = Money::Bank::CurrencylayerBank.new
  mclb.access_key = CURRENCYLAYER_BANK_CONFIG['api_key']
  mclb.update_rates
  mclb.ttl_in_seconds = 15

  config.default_bank = mclb
end
