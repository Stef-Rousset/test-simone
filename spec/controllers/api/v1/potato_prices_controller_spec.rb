require 'rails_helper'

RSpec.describe Api::V1::PotatoPricesController, type: :controller do
  render_views # required to access response.body

  before(:example) do
    @pp = create(:pp_normal)
    @pp_two = create(:pp_valid)
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
    expect(body.first.values).to eq([@pp.price_at.strftime("%Y-%m-%dT%H:%M:%S.%L%z"), @pp.amount.to_s])
    expect(body).not_to include(@pp_two.price_at.strftime("%Y-%m-%dT%H:%M:%S.%L%z"))
  end
end
