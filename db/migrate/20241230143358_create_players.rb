class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.bigint :hand_pile
      t.bigint :face_down_pile
      t.bigint :face_up_pile

      t.timestamps
    end

    add_foreign_key :players, :piles, column: :hand_pile
    add_foreign_key :players, :piles, column: :face_down_pile
    add_foreign_key :players, :piles, column: :face_up_pile

    add_index :players, %i[user_id game_id], unique: true
  end
end
