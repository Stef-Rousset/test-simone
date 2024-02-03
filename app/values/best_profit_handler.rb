class BestProfitHandler
  attr_reader :array # for tests

  def initialize(array)
    @array = array
  end

  def get_best_profit
    result = 0
    @array.each_with_index do |value, index|
      buying_value = BigDecimal(value.to_s)
      # iterate on each following value of buying_value
      for i in index..(@array.length - 1)
        selling_value = @array[i + 1]
        next if selling_value.nil?
        selling_value = BigDecimal(selling_value.to_s)
        # skip if following value is less or equal buying_value
        next if buying_value >= selling_value
        # update best profit if it is superior
        result = (selling_value - buying_value) * 100 if (selling_value - buying_value) * 100 > result
      end
    end
    result
  end
end
