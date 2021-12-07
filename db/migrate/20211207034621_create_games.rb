class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :host_id
      t.text :description
      t.date :date
      t.time :time
      t.string :max_attendees
      t.integer :game_category_id
      t.string :loction

      t.timestamps
    end
  end
end
