class UserVenue < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :venue, uniqueness: {scope: :user}
end
