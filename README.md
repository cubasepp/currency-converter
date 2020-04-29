# README

- run rake db:migrate
- run rake db:Seed
- rails server

go to http://localhost:3000/

Important
- whenever does execute every day at 8 PM a rake task:
  - rake 'money_currencylayer_bank_importer:perform'
- Update the API key in `config/currency_layer_bank.yml`
