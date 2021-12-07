class Game < ApplicationRecord
  # Direct associations

  has_many   :attendees,
             :dependent => :destroy

  has_many   :comments,
             :class_name => "Message",
             :dependent => :destroy

  belongs_to :host,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    host.to_s
  end

end
