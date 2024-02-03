require 'rails_helper'

RSpec.describe BestProfitHandler, type: :model do
  before(:example) do
    @array = [7.25, 5.12, 3.5, 9.0, 6.0, 5.5, 7.0, 6.25, 7.15, 8.0, 7.0, 5.55, 7.95]
    @fall = @array.sort.reverse
  end

  it 'should initialize with array' do
    prices = BestProfitHandler.new(@array)
    expect(prices.array).to eq(@array)
  end

  it 'should return best profit' do
    best = BestProfitHandler.new(@array).get_best_profit
    expect(best).to eq(550.0)
  end

  it 'should return 0 if no profit possible' do
    best = BestProfitHandler.new(@fall).get_best_profit
    expect(best).to eq(0)
  end
end
