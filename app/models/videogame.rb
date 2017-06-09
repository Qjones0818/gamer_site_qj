class Videogame < ApplicationRecord
  has_many :hypes
  has_many :ratings

  def average_rating
    ratings.map { |r| r.score  }.inject{ |sum, el| sum+ el }.to_f / ratings.size
  end

end
