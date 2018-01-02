class Venue < ApplicationRecord
  has_many :user_venues
  has_many :users, through: :user_venues

  def self.call_api(lat, lon, radius, section)
    date = self.get_date
    meters = self.convert_miles_to_meters(radius)
    client = Foursquare2::Client.new(:client_id => ENV['client_id'],
            :client_secret => ENV['client_secret'],
            :api_version => '20171231')
    ll = lat + ',' + lon
    client.explore_venues(:ll => ll, :radius=> meters, :section=> section, :limit => 100).groups[0]
  end

  def self.create_from_location(lat = '40.704069', lon = '-74.0132413', radius="5", section='food')
    created_venues = []
    venue_data = self.call_api(lat, lon, radius, section)
    venue_data.items.each do |data|
      venue = Venue.find_or_create_by(
        name: data.venue.name,
        address:  data.venue.location.address,
        city:  data.venue.location.city,
        state: data.venue.location.state,git
        postalCode:  data.venue.location.postalCode,
        lat:  data.venue.location.lat,
        lng:  data.venue.location.lng,
        category:  data.venue.categories[0].name,
        url:  data.venue.url
      )

      created_venues << venue
    end
    created_venues
  end

  def self.get_date
    year = Date.today.year
    month = Date.today.month
    day = Date.today.day
    date = [year, month, day].join('')
    date
  end

  def self.convert_miles_to_meters(miles)
    (miles.to_i * 1609.34).floor.to_s
  end

  def self.get_coords_from_address(address, city, state, zip)
    full_address = [address, city, state, zip].join(',')
    Geocoder.coordinates(full_address)
  end

end
