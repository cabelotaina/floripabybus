json.array!(@buslines) do |busline|
  json.extract! busline, :number, :line, :company, :card_price, :money_price, :time_to_go, :time_to_back, :busdayofweek_id
  json.url busline_url(busline, format: :json)
end
