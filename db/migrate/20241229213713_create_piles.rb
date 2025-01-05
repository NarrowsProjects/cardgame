class CreatePiles < ActiveRecord::Migration[8.0]
  def change
    create_table :piles, &:timestamps
  end
end
