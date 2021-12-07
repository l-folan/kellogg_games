class AttendeeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :game_id, :integer
  attribute :attendance_status, :string
  attribute :waitlist_status, :string
  attribute :player_id, :integer

  # Direct associations

  belongs_to :game

  belongs_to :player,
             resource: UserResource

  # Indirect associations
end
