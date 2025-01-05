class Game < ApplicationRecord
  belongs_to :play_pile, class_name: "Pile", inverse_of: :games_as_play_pile
  belongs_to :stock_pile, class_name: "Pile", inverse_of: :games_as_stock_pile

  enum :status, { Waiting_for_players: "Waiting_for_players", Started: "Started", Ended: "Ended" }, prefix: true
end
