class AddPlayerReferenceToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendees, :users, column: :player_id
    add_index :attendees, :player_id
    change_column_null :attendees, :player_id, false
  end
end
