class User < ApplicationRecord
  # Direct associations

  has_many   :messages,
             foreign_key: "author_id",
             dependent: :destroy

  has_many   :games_attending,
             class_name: "Attendee",
             foreign_key: "player_id",
             dependent: :destroy

  has_many   :games_hosted,
             class_name: "Game",
             foreign_key: "host_id",
             dependent: :destroy

  # Indirect associations

  has_many   :game_messages,
             through: :messages,
             source: :game

  has_many   :games_joined,
             through: :games_attending,
             source: :game

  # Validations

  # Scopes

  def to_s
    username
  end
end
