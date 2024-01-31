json.array! @potato_prices do |pp|
  json.time pp.price_at.strftime("%Y-%m-%dT%H:%M:%S.%L%z")
  json.value pp.amount
end
