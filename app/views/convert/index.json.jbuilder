# app/views/rates/index.json.jbuilder
json.converted_amount @converted_amount
json.rates @rates, :date, :rate
