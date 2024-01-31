require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CategoriesHelper. For example:
#
# describe CategoriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
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
