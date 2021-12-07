json.extract! message, :id, :author_id, :description, :game_id, :created_at, :updated_at
json.url message_url(message, format: :json)
