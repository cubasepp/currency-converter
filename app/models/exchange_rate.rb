class ExchangeRate < ApplicationRecord
   validates :date, :rate, :from_currency, :to_currency, presence: true
   scope :find_all_by_from_currecny, -> (from, to) {
     self.where(from_currency: from, to_currency: to).order(date: :desc)
   }
end
