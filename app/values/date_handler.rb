class DateHandler
  attr_reader :date   #for tests

  def initialize(date)
    @date = Date.parse(date)
    rescue Date::Error
      @date = nil
  end

  def date_limits
    if !@date.nil?
      @year, @month, @day = @date.year, @date.month, @date.day
	    [DateTime.new(@year, @month, @day), DateTime.new(@year, @month, @day, 23, 59, 59)]
    else
      []
    end
  end
end
