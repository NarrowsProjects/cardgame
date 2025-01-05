class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_enum :suit, %w[Hearts Diamonds Clubs Spades]

    create_table :cards do |t|
      t.references :pile, null: false, foreign_key: true
      t.integer :position, null: false
      t.enum :suit, enum_type: "suit", null: false
      t.integer :weight, null: false

      t.timestamps
    end

    add_index :cards, %i[position pile_id], unique: true, name: "index_cards_on_position_and_pile_id"
  end
end
