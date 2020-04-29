every 1.day, at: '08:00am', by_timezone: 'Europe/Berlin'  do
  rake 'money_currencylayer_bank_importer:perform'
end
