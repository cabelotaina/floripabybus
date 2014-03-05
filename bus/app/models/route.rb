class Route < ActiveRecord::Base
 belongs_to :line
 has_many :places, dependent: :destroy
end
