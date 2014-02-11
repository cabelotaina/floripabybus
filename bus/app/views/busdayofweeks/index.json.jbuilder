json.array!(@busdayofweeks) do |busdayofweek|
  json.extract! busdayofweek, :day, :direction, :bustime_id
  json.url busdayofweek_url(busdayofweek, format: :json)
end
