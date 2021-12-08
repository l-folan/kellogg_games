class AddGameTypeReferenceToGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :game_categories
    add_index :games, :game_category_id
    change_column_null :games, :game_category_id, false
  end
end
