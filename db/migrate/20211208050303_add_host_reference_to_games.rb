class AddHostReferenceToGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :users, column: :host_id
    add_index :games, :host_id
    change_column_null :games, :host_id, false
  end
end
