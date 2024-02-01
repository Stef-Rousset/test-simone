require 'rails_helper'

RSpec.describe Api::V1::PotatoPricesHelper, type: :helper do

  it "should return a string with no trailing zeros" do
    expect(display_best_profit_result(5.00)).to eq("5€")
  end

  it 'should return an string with the 2 decimals after zero if they are not zeros' do
    expect(display_best_profit_result(5.25)).to eq("5.25€")
  end

  it 'should return an string with the 1 decimal after zero if last decimal is zero' do
    expect(display_best_profit_result(5.20)).to eq("5.2€")
  end
end
