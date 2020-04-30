# app/views/rates/index.json.jbuilder
json.converted_amount @converted_amount
json.exchange_rates @exchange_rates, :date, :rate
