class VenuesController < ApplicationController

    def index
        @venues = Venue.all
        render json: @venues
    end


    def create
        if !params[:address]
            @venues = Venue.create_from_location(
                params[:lat], params[:lon], params[:radius], params[:selection])
        else
            @coords = Venue.get_coords_from_address(params[:address], params[:city],params[:state],params[:zip])
            @venues = Venue.create_from_location(
                @coords[0].to_s, @coords[1].to_s, params[:radius], params[:selection]
            )
        end
        render json: {venues: @venues, coords: @coords}
    end
end