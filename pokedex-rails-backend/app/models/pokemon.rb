class Pokemon < ApplicationRecord
    TYPES = [
        'fire',
        'electric',
        'normal',
        'ghost',
        'psychic',
        'water',
        'bug',
        'dragon',
        'grass',
        'fighting',
        'ice',
        'flying',
        'poison',
        'ground',
        'rock',
        'steel'
    ].sort.freeze

    validates :attack, :defense, numericality: { in: 0..100 }
    validates :poke_type, inclusion: { in: TYPES, message: "%{value} is not a valid Pokemon type"}
    validates :image_url, presence: true

    validates :number, numericality: { greater_than: 0 }, uniqueness: { message: "%{value} is already in use"}
    validates :name, length: { in: 3..255 }, uniqueness: { message: "%{value} is already in use"}
    validates :captured, inclusion: { in: [true, false], message: "Captured must be true or false" }

    has_many :poke_moves,
        dependent: :destroy

    has_many :moves,
        through: :poke_moves

    has_many :items,
        foreign_key: :pokemon_id

end
