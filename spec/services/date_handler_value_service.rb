require 'rails_helper'

RSpec.describe DateHandler, type: :model do
  before(:example) do
    @pp = create(:pp_valid)
    @pp_two = create(:pp_same_date)
  end

  it 'should parse date when initializing' do
    handler = DateHandler.new("2024-01-31")
    expect(handler.dates).to eq(Date.parse("2024-01-31").all_day)
  end

  it 'should return date equal to nil when initializing if provided date is invalid' do
    handler = DateHandler.new("2024-31-31")
    expect(handler.dates).to eq(nil)
  end

  it 'should return an array of 2 dates' do
    array = DateHandler.new("2024-01-30").date_limits
    d = Date.parse("2024-01-30").all_day
    expect(array.class).to eq(Array)
    expect(array).to eq([d.first, d.last])
  end

  it 'should return an empty array when calling date_limits method if date is not valid' do
    array = DateHandler.new("2024-30-30").date_limits
    expect(array.class).to eq(Array)
    expect(array).to eq([])
  end
end
