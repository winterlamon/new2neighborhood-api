class VenuesController < ApplicationController

    def index
        @venues = Venue.all
        render :json => @venues
    end


    def create
        @venues = Venue.create_from_location
        render :json => @venues
    end

end
