class BestProfitHandler
  attr_reader :array # for tests

  def initialize(array)
    @array = array.map! { |elem| BigDecimal(elem.to_s) }
  end

  def get_best_profit
    result = 0
    min_price = @array[0]
    @array.each do |value|
      # update min_price if current value is less than min_price
      if value < min_price
        min_price = value
      # update result if (current value - min_price) * 100 is superior to current result
      elsif (value - min_price) * 100 > result
        result = (value - min_price) * 100
      end
    end
    result
  end
end
