class Api::V1::PotatoPricesController < ActionController::API

  def index
    dates = DateHandler.new(params[:date]).date_limits
    if dates.present?
	    @potato_prices = PotatoPrice.where("price_at >= ?", dates[0])
                                  .where("price_at <= ?", dates[1])
                                  .order(:price_at)
      render json: { error: "Data not available for that date" } if @potato_prices.empty?
    else
      render json: { error: "Invalid date" }
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
        render json: { error: "Data not available for that date" }
      end
    else
      render json: { error: "Invalid date" }
    end
  end
end
