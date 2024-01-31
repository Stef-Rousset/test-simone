class Api::V1::PotatoPricesController < ActionController::API

  def index
    dates = DateHandler.new(params[:date]).date_limits
    if dates.present?
	    @potato_prices = PotatoPrice.where("price_at >= ?", dates[0])
                                  .where("price_at <= ?", dates[1])
                                  .order(:price_at)
      render_no_data if @potato_prices.empty?
    else
      render_invalid_date
    end
  end

  def best_profit
    dates = DateHandler.new(params[:date]).date_limits
    if dates.present?
      values = PotatoPrice.where("price_at >= ?", dates[0])
                          .where("price_at <= ?", dates[1])
                          .map{|element| element[:amount].to_f}
      if values.present?
        @result = 100*(BigDecimal(values.max.to_s) - BigDecimal(values.min.to_s))
      else
        render_no_data
      end
    else
      render_invalid_date
    end
  end

  private

  def render_no_data
    render json: { information: "No data for that date" }, status: :ok
  end

  def render_invalid_date
    render json: { error: "Invalid date" }, status: :unprocessable_entity # http code 422
  end
end
