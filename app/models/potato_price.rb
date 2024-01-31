class PotatoPrice < ApplicationRecord

  validates :price_at, :amount, presence: true
  validates :amount, numericality: { greater_than: 0, less_than: 10_000 }
end
