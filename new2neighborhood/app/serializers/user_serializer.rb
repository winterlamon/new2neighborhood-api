class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :venues

  def venues
    object.venues.map do |venue|
    all_user_venues = venue.user_venues.map {|uv| {visited: uv.visited}.merge(uv.venue.attributes)}

    venue.attributes.merge({user_venues: all_user_venues})
    end
  end
end
