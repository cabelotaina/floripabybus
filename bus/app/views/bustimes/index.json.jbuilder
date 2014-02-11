json.array!(@bustimes) do |bustime|
  json.extract! bustime, :time, :label
  json.url bustime_url(bustime, format: :json)
end
