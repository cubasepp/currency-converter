namespace :exchange_rate_importer do
  desc 'Import current rates'
  task :perform => :environment do
    ExchangeRateImporter.perform
  end
end
