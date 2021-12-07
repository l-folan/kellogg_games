class AddAttendeeCountToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :attendees_count, :integer
  end
end
