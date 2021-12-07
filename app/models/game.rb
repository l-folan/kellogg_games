class Game < ApplicationRecord
  # Direct associations

  belongs_to :game_category

  has_many   :attendees,
             :dependent => :destroy

  has_many   :comments,
             :class_name => "Message",
             :dependent => :destroy

  belongs_to :host,
             :class_name => "User"

  # Indirect associations

  has_many   :authors,
             :through => :comments,
             :source => :author

  has_many   :players,
             :through => :attendees,
             :source => :player

  # Validations

  # Scopes

  def to_s
    host.to_s
  end

end
