class AddLoctionLongitudeToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :loction_longitude, :float
  end
end
