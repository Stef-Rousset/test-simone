class Api::V1::PotatoPricesController < ActionController::API

  def index
    @date = Date.parse(params[:date])
	  @year, @month, @day = @date.year, @date.month, @date.day
	  start_time = DateTime.new(@year, @month, @day)
	  end_time = DateTime.new(@year, @month, @day, 23, 59)
	  @potato_prices = PotatoPrice.all.where("price_at >= ?", start_time).where("price_at <= ?", end_time).order(:price_at)
  end

end
