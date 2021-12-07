class GameResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :host_id, :integer
  attribute :description, :string
  attribute :date, :date
  attribute :time, :string
  attribute :max_attendees, :string
  attribute :game_category_id, :integer
  attribute :loction, :string

  # Direct associations

  belongs_to :host,
             resource: UserResource

  # Indirect associations

end
