class Move < ApplicationRecord
    validates :name, uniqueness: { message: "%{value} is already in use!"}

    has_many :poke_moves,
        foreign_key: :move_id,
        dependent: :destroy

    has_many :pokemon,
        through: :poke_moves,
        source: :pokemon
end
