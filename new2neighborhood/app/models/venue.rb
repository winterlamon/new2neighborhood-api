class Venue < ApplicationRecord
  belongs_to :list


  def call_api(lon='40.704069', lat='-74.0132413')
    client = Foursquare2::Client.new(:client_id => '1XA3FP3VEHXNXDJSA1GMNDARTHHSZ2KJ5PLHKW0MBM50MFX0', 
            :client_secret => 'Y5ETOZQBBOZA5WJHAQEGNLIVBEGD0BGRTSZXUQPCBXQD0C30', 
            :api_version => '20171220')
    ll = lon + ',' + lat
    client.search_venues(:ll => ll)
  end
end
