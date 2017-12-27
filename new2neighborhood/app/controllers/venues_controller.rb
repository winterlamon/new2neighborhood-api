class VenuesController < ApplicationController

    def index
        @venues = Venue.all
        render :json => @venues
    end


    def create
        @venue = Venue.create_from_location #takes lat, lon, radius, section arguments
        render :json=>  @venue
    end

end
