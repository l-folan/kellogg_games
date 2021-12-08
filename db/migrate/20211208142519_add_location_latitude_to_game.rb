class AddLocationLatitudeToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :location_latitude, :float
  end
end
