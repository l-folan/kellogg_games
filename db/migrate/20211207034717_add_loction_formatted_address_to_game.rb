class AddLoctionFormattedAddressToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :loction_formatted_address, :string
  end
end
