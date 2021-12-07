class AddLoctionLatitudeToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :loction_latitude, :float
  end
end
