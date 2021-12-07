class User < ApplicationRecord
  # Direct associations

  has_many   :games,
             :foreign_key => "host_id",
             :dependent => :destroy

  has_many   :comments,
             :class_name => "Message",
             :foreign_key => "author_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    username
  end

end
