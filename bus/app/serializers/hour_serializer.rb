class HourSerializer < ActiveModel::Serializer
  attributes :time

  def newtime
   "#{:time.strftime("%H:%M")}"
  end
end
