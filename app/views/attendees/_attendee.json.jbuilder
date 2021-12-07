json.extract! attendee, :id, :game_id, :player_id, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
