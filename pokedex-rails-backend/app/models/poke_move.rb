class PokeMove < ApplicationRecord
  validates :move_id, uniqueness: { scope: :pokemon_id, 
    message: "Pokemon cannot have the same move more than once!" }

  belongs_to :pokemon,
    foreign_key: :pokemon_id

  belongs_to :move,
    foreign_key: :move_id
end
