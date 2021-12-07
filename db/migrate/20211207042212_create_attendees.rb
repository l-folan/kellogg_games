class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.integer :game_id
      t.string :attendance_status
      t.string :waitlist_status
      t.integer :player_id

      t.timestamps
    end
  end
end
