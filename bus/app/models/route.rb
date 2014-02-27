class Route < ActiveRecord::Base
 has_many :places, -> {order("position ASC")}
end
