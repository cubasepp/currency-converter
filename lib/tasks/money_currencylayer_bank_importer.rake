namespace :money_currencylayer_bank_importer do
  desc 'Import current rates'
  task :perform => :environment do
    MoneyCurrencylayerBankImporter.perform
  end
end
