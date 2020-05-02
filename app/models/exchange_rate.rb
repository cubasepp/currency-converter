class ExchangeRate < ApplicationRecord
   validates :date, :rate, :from_currency, :to_currency, presence: true
   scope :find_all_by_from_to_currency, -> (from, to) {
     self.where(from_currency: from, to_currency: to).order(date: :desc)
   }
end
