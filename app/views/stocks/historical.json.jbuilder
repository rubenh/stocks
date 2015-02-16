json.array! @stock do |history|
  json.trade_date history.trade_date
  json.open history.open
  json.close history.close
  json.low history.low
  json.high history.high
  json.volume history.volume
  json.adjusted_close history.adjusted_close
end
