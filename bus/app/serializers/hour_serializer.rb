class HourSerializer < ActiveModel::Serializer
  attributes :newtime

  def newtime
   object.time = object.time-3.hours
   "#{object.time.strftime("%H:%M")}"
  end
end
