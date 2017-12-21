class Venue < ApplicationRecord

  def self.call_api(lon, lat)
    client = Foursquare2::Client.new(:client_id => '1XA3FP3VEHXNXDJSA1GMNDARTHHSZ2KJ5PLHKW0MBM50MFX0',
            :client_secret => 'Y5ETOZQBBOZA5WJHAQEGNLIVBEGD0BGRTSZXUQPCBXQD0C30',
            :api_version => '20171220')
    ll = lon + ',' + lat
    client.search_venues(:ll => ll).venues
  end

  def self.create_from_location(lon='40.704069', lat='-74.0132413')
    created_venues = []
    venue_data = self.call_api(lon, lat)
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

end
