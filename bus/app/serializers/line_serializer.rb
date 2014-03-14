class LineSerializer < ActiveModel::Serializer
# insert other attributtes from Line
  attributes :name, :number
 # has_many :dayofweeks
end
