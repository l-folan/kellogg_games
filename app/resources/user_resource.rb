class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :messages,
             foreign_key: :author_id

  has_many   :games_attending,
             resource: AttendeeResource,
             foreign_key: :player_id

  has_many   :games_hosted,
             resource: GameResource,
             foreign_key: :host_id

  # Indirect associations

  many_to_many :game_messages,
               resource: GameResource

  many_to_many :games_joined,
               resource: GameResource
end
