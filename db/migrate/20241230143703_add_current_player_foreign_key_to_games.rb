class AddCurrentPlayerForeignKeyToGames < ActiveRecord::Migration[8.0]
  def change
    add_reference :games, :current_player, foreign_key: { to_table: :players }, type: :bigint, index: true
  end
end
