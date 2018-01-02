class UserVenueSerializer < ActiveModel::Serializer
  attributes :user_id, :venue_id, :visited

  belongs_to :user
  belongs_to :venue
end
