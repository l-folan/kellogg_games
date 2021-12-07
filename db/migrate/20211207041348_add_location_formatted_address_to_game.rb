class AddLocationFormattedAddressToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :location_formatted_address, :string
  end
end
