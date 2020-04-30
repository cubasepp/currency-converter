class ChangeRatesToExchangeRates < ActiveRecord::Migration[6.0]
  def change
    rename_table :rates, :exchange_rates
  end
end
