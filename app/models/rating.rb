class Rating < ApplicationRecord
  validates :videogame_id, uniqueness: { scope: :user_id }
  belongs_to :videogame
  belongs_to :user
end
