class Message < ApplicationRecord
  # Direct associations

  belongs_to :game

  belongs_to :author,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end
end
