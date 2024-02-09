class Api::V1::PotatoPricesController < ActionController::API
  before_action :handle_date

  def index
    @potato_prices = PotatoPrice.from_date(@dates[0])
                                .to_date(@dates[1])
                                .order(:price_at)
    render_no_data if @potato_prices.empty?
  end

  def best_profit
    values = PotatoPrice.from_date(@dates[0])
                        .to_date(@dates[1])
                        .order(:price_at)
                        .pluck(:amount)
    if values.present?
      @result = BestProfitHandler.new(values).get_best_profit
    else
      render_no_data
    end
  end

  private

  def render_no_data
    render json: { information: "No data for that date" }, status: :ok
  end

  def render_invalid_date
    render json: { error: "Invalid date" }, status: :unprocessable_entity # http code 422
  end

  def handle_date
    @dates = DateHandler.new(params[:date]).date_limits
    render_invalid_date if @dates.empty?
  end
end
