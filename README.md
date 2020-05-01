# README

- run rake db:migrate
- run rake db:Seed
- rails server


Important
- whenever does execute every day at 8 PM a rake task:
  - `rake 'exchange_rate_importer:perform'`
- Update the API key in `config/currency_layer_bank.yml`


To test run:
```
curl --request GET \
  --url 'http://localhost:3000/api/convert?amount=250&from_currency=EUR&to_currency=USD' \
  --header 'content-type: application/json'
```
```
curl --request GET \
  --url http://localhost:3000/api/exchange_rates \
  --header 'content-type: application/json'
```
