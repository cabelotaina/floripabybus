class DayofweekSerializer < ActiveModel::Serializer
  attributes :day, :path
  has_many :hours
end
