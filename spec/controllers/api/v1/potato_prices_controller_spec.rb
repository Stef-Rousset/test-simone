require 'rails_helper'

RSpec.describe Api::V1::PotatoPricesController, type: :controller do
  render_views # required to access response.body

  before(:example) do
    @pp = create(:pp_normal)
    @pp_two = create(:pp_valid)
    @same_date = create(:pp_same_date)
  end

  it 'should get index' do
    get :index, params: { format: :json, date: "2024-01-31" }
    assert_response :success
  end

  it 'should return and array with one element in index' do
    get :index, params: { format: :json, date: "2024-01-31" }
    body = JSON.parse(response.body)
    expect(body.class).to eq(Array)
    expect(body.length).to eq(1)
    expect(body.first.keys).to eq(["time", "value"])
    expect(body.first.values).to eq([@pp.price_at.iso8601, @pp.amount.to_s])
    expect(body).not_to include(@pp_two.price_at.iso8601)
  end

  it 'should return error message if date is invalid when querying index' do
    get :index, params: { format: :json, date: "2024-31-31" }
    body = JSON.parse(response.body)
    expect(body).to eq({"error"=>"Invalid date"})
  end

  it 'should return error message if no values for the date when querying index' do
    get :index, params: { format: :json, date: "2025-01-30" }
    body = JSON.parse(response.body)
    expect(body).to eq({"error"=>"Data not available for that date"})
  end

  it 'should get best_profit' do
    get :best_profit, params: { format: :json, date: "2024-01-31" }
    assert_response :success
  end

  it 'should return best profit value in a hash' do
    get :best_profit, params: { format: :json, date: "2024-01-30" }
    body = JSON.parse(response.body)
    expect(body.class).to eq(Hash)
    expect(body).to eq({"best_profit"=>"1€"})
  end

  it 'should return error message if date is invalid when querying best_profit' do
    get :best_profit, params: { format: :json, date: "2024-31-31" }
    body = JSON.parse(response.body)
    expect(body).to eq({"error"=>"Invalid date"})
  end

  it 'should return error message if no values for the date when querying best_profit' do
    get :best_profit, params: { format: :json, date: "2025-01-30" }
    body = JSON.parse(response.body)
    expect(body).to eq({"error"=>"Data not available for that date"})
  end
end
