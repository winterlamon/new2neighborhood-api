class VenuesController < ApplicationController

    def index
        @venues = Venues.all
        render :json => @venues
    end


    def create
        @venues = Venue.create_from_location
        render :json => @venues
    end

end
