class Pile < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :games_as_play_pile,
           class_name: "Game",
           foreign_key: :play_pile,
           inverse_of: :play_pile,
           dependent: :destroy
  has_many :games_as_stock_pile,
           class_name: "Game",
           foreign_key: :stock_pile,
           inverse_of: :stock_pile,
           dependent: :destroy
end
