class DateHandler
  attr_reader :dates   #for tests

  def initialize(date)
    @dates = Date.parse(date).all_day
    rescue Date::Error
      @dates = nil
  end

  def date_limits
    @dates.nil? ? [] : [@dates.first, @dates.last]
  end
end
