require 'rails_helper'

RSpec.describe PotatoPrice, type: :model do

  it 'should be invalid if price_at is absent' do
    pp = build(:pp_without_date)
    expect(pp).not_to be_valid
  end

  it 'should be invalid if amount is absent' do
    pp = build(:pp_without_amount)
    expect(pp).not_to be_valid
  end

  it 'should be invalid if amount is not a number' do
    pp = build(:pp_amount_string)
    expect(pp).not_to be_valid
  end

  it 'should be invalid if amount is greater than 9999.99' do
    pp = build(:pp_amount_big)
    expect(pp).not_to be_valid
  end

  it 'should be invalid if amount is less or equal to 0' do
    pp = build(:pp_amount_low)
    expect(pp).not_to be_valid
  end

  it 'should be valid if price_at is present and amount is greater than 0 and less than 10000' do
    pp = build(:pp_normal)
    expect(pp).to be_valid
  end
end
