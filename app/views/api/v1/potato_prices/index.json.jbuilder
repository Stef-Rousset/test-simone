json.array! @potato_prices do |pp|
  json.time pp.price_at.iso8601
  json.value pp.amount
end
