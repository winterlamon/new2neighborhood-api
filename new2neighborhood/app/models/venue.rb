class Venue < ApplicationRecord

  def self.call_api(lat, lon)
    date = self.get_date
    client = Foursquare2::Client.new(:client_id => '1XA3FP3VEHXNXDJSA1GMNDARTHHSZ2KJ5PLHKW0MBM50MFX0', 
            :client_secret => 'Y5ETOZQBBOZA5WJHAQEGNLIVBEGD0BGRTSZXUQPCBXQD0C30', 
            :api_version => date)
    ll = lat + ',' + lon
    client.search_venues(:ll => ll, :query => 'bar+restaurant', :limit => 50).venues
  end

  def self.create_from_location(lat = '40.704069', lon = '-74.0132413')
    created_venues = []
    venue_data = self.call_api(lat, lon)
    venue_data.each do |data| 
      venue = Venue.find_or_create_by(
        name: data.name,
        address:  data.location.address,
        city:  data.location.city,
        state: data.location.state,
        postalCode:  data.location.postalCode,
        lat:  data.location.lat,
        lng:  data.location.lng,
        category:  data.categories[0].name,
        description:  data.description,
        url:  data.url
      )

      created_venues << venue
    end
    created_venues
  end

  def self.get_date
    year = Date.today.year
    month = Date.today.month
    day = Date.today.day
    today = [year, month, day].join('')
  end
end
