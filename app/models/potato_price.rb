class PotatoPrice < ApplicationRecord

  validates :price_at, presence: true
  validates :amount, numericality: { greater_than: 0, less_than: 10_000 }

  scope :from_date, ->(date) { where('price_at >= ?', date) }
  scope :to_date, ->(date) { where('price_at <= ?', date) }
end
