json.extract! game, :id, :host_id, :description, :date, :time, :max_attendees,
              :game_category_id, :loction, :created_at, :updated_at
json.url game_url(game, format: :json)
