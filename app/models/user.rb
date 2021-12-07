class User < ApplicationRecord
  # Direct associations

  has_many   :attendees,
             foreign_key: "player_id",
             dependent: :destroy

  has_many   :games,
             foreign_key: "host_id",
             dependent: :destroy

  has_many   :comments,
             class_name: "Message",
             foreign_key: "author_id",
             dependent: :destroy

  # Indirect associations

  has_many   :messages,
             through: :comments,
             source: :game

  has_many   :accepted_games,
             through: :attendees,
             source: :game

  # Validations

  # Scopes

  def to_s
    username
  end
end
