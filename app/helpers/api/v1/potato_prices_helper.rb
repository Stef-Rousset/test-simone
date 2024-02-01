module Api::V1::PotatoPricesHelper

  def display_best_profit_result(value)
    "#{number_with_precision(value, strip_insignificant_zeros: true)}€"
  end
end
