class CreatePiles < ActiveRecord::Migration[7.1]
  def change
    create_table :piles, &:timestamps
  end
end
