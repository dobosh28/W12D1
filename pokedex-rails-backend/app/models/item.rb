class Item < ApplicationRecord
  validates :name, length: { maximum: 254 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :happiness, :image_url, presence: true

  belongs_to :pokemon,
    primary_key: :id,
    foreign_key: :pokemon_id,
    class_name: :Pokemon
end
