class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :author_id, :integer
  attribute :description, :string
  attribute :game_id, :integer

  # Direct associations

  belongs_to :game

  belongs_to :author,
             resource: UserResource

  # Indirect associations
end
