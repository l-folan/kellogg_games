class AddGameReferenceToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendees, :games
    add_index :attendees, :game_id
    change_column_null :attendees, :game_id, false
  end
end
