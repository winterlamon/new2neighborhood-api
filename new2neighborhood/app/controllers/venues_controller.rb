class VenuesController < ApplicationController

    def index
    end

    def show
    end

    def create
        venues = Venue.call_api
        venues.each do |venue| 
            Venue.new
            Venue.name = venue.name
            Venue.save
    end

end
