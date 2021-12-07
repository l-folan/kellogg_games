class GameCategory < ApplicationRecord
  # Direct associations

  has_many   :categories,
             class_name: "Game",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
