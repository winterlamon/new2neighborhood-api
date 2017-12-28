class VenuesController < ApplicationController

    def index
        @venues = Venue.all
        render json: @venues
    end


    def create
        #takes lat, lon, radius, section arguments
        @venues = Venue.create_from_location(
            params[:lat], params[:lon], params[:radius], params[:selection]) 
        render json: @venues
    end

end