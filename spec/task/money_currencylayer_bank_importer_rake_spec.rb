require "rails_helper"
Rails.application.load_tasks

describe 'import rates rake tasks', type: :rake do
  it 'import data' do
    expect(MoneyCurrencylayerBankImporter).to receive(:perform).once()

    Rake::Task['money_currencylayer_bank_importer:perform'].invoke
  end
end
