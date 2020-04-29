require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'validations' do
      it { should validate_presence_of(:date) }
      it { should validate_presence_of(:rate) }
      it { should validate_presence_of(:from_currency) }
      it { should validate_presence_of(:to_currency) }
  end
end
