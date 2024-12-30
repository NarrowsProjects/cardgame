class AddCurrentPlayerForeignKeyToGames < ActiveRecord::Migration[7.1]
  def change
    add_reference :games, :current_player, foreign_key: { to_table: :players }, type: :bigint, index: true
  end
end
