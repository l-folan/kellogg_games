class AddGameReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :games
    add_index :messages, :game_id
    change_column_null :messages, :game_id, false
  end
end
