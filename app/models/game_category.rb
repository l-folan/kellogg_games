class GameCategory < ApplicationRecord
  # Direct associations

  has_many   :games,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
