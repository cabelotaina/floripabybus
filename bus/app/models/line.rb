class Line < ActiveRecord::Base
 has_many :dayofweeks, dependent: :destroy
 has_many :references,dependent: :destroy
 has_many :routes, dependent: :destroy 
end
