class AddLocationLongitudeToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :location_longitude, :float
  end
end
