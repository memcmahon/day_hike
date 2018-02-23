class Trail < ApplicationRecord
  has_many :trip_trails
  has_many :trips, through: :trip_trails
end
