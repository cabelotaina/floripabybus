class Place < ActiveRecord::Base
  belongs_to :route
  belongs_to :reference
end
