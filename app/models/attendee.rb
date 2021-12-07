class Attendee < ApplicationRecord
  # Direct associations

  belongs_to :game,
             counter_cache: true

  belongs_to :player,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    game.to_s
  end
end
