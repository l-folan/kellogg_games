require 'open-uri'
class Game < ApplicationRecord
  before_validation :geocode_loction

  def geocode_loction
    if self.loction.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.loction)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.loction_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.loction_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.loction_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
