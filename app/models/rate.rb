class Rate < ApplicationRecord
   validates :date, :rate, :from_currency, :to_currency, presence: true
end
