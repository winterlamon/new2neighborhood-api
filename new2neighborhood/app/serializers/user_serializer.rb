class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :password_digest, :venues

  def venues
    object.user_venues.map do |user_venue|
      { visited: user_venue.visited }.merge(user_venue.venue.attributes)
    end
  end
end
