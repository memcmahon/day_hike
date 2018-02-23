class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    trails.sum(:length)
  end

  def average_trail_length
    trails.average(:length)
  end

  def trails_by_length
    trails.order(:length)
  end

  def longest_trail
    trails_by_length.last
  end
  
  def shortest_trail
    trails_by_length.first
  end
end
