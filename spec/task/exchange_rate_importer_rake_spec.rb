require "rails_helper"
Rails.application.load_tasks

describe 'import exchange rates - rake tasks', type: :rake do
  it 'import data' do
    expect(ExchangeRateImporter).to receive(:perform).once()

    Rake::Task['exchange_rate_importer:perform'].invoke
  end
end
