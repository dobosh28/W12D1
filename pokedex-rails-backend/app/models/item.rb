class Item < ApplicationRecord
  validates :name, length: { less_than: 255 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :happiness, :image_url, presence: true

  belongs_to :pokemon,
    primary_id: :id,
    foreign_key: :pokemon_id,
    class_name: :Pokemon
end
