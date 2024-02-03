class BestProfitHandler
  attr_reader :array # for tests

  def initialize(array)
    @array = array
  end

  def get_best_profit
    result = 0
    min_price = BigDecimal(@array[0].to_s)
    @array.each do |value|
      # update min_price if current value is less than min_price
      if BigDecimal(value.to_s) < min_price
        min_price = BigDecimal(value.to_s)
      # update result if (current value - min_price) * 100 is superior to current result
      elsif (BigDecimal(value.to_s) - min_price) * 100 > result
        result = (BigDecimal(value.to_s) - min_price) * 100
      end
    end
    result
  end
end
