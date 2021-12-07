class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :attendees,
             foreign_key: :player_id

  has_many   :games,
             foreign_key: :host_id

  has_many   :comments,
             resource: MessageResource,
             foreign_key: :author_id

  # Indirect associations

  many_to_many :messages,
               resource: GameResource

  many_to_many :joined_games,
               resource: GameResource
end
