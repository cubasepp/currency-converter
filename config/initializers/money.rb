CURRENCYLAYER_BANK_CONFIG = YAML.safe_load(File.read(Rails.root.join('config', 'currency_layer_bank.yml')))[Rails.env]
require 'money/bank/currencylayer_bank'

MoneyRails.configure do |config|
  mclb = Money::Bank::CurrencylayerBank.new
  mclb.access_key = CURRENCYLAYER_BANK_CONFIG['api_key']
  mclb.ttl_in_seconds = 86400
  mclb.cache = Rails.root.join('storage/currencylayer_cache')
  mclb.update_rates
  config.default_bank = mclb
  config.rounding_mode = BigDecimal::ROUND_HALF_EVEN
end
