require "open-uri"
class Game < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :game_type,
             class_name: "GameCategory",
             foreign_key: "game_category_id"

  has_many   :attendees,
             dependent: :destroy

  has_many   :messages,
             dependent: :destroy

  belongs_to :host,
             class_name: "User"

  # Indirect associations

  has_many   :authors,
             through: :messages,
             source: :author

  has_many   :players,
             through: :attendees,
             source: :player

  # Validations

  # Scopes

  def to_s
    description
  end
end
