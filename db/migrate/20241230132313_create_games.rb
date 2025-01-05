class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_enum :status, %w[Waiting_for_players Started Ended]

    create_table :games do |t|
      t.integer :playercount, null: false
      t.string  :name, null: false
      t.enum    :status, enum_type: 'status', null: false, default: 'Waiting_for_players'
      t.bigint  :play_pile_id, null: false
      t.bigint  :stock_pile_id, null: false
      t.boolean :online, null: false, default: false

      t.timestamps
    end

    add_foreign_key :games, :piles, column: :play_pile_id
    add_foreign_key :games, :piles, column: :stock_pile_id

    add_index :games, :play_pile_id,      unique: true
    add_index :games, :stock_pile_id,     unique: true
  end
end
