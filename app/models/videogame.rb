class Videogame < ApplicationRecord
  has_many :hyped_games, :dependent => :destroy

end
