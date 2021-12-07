class Attendee < ApplicationRecord
  # Direct associations

  belongs_to :player,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    game.to_s
  end

end
