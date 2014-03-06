class Dayofweek < ActiveRecord::Base
 belongs_to :line
 has_many :hours, dependent: :destroy
end
