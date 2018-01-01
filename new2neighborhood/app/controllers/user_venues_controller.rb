class UserVenuesController < ApplicationController

  def index
    @user_venues = UserVenue.all

    render json: @user_venues
  end

  def show
  end

  def create
    @user_venue = UserVenue.new(user_venue_params)

    if @user_venue.save
      render :show, status: :created, location: @user_venue
    else
      render json: @user_venue.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_venue.update(user_venue_params)
      render :show, status: :ok, location: @user_venue
    else
      render json: @user_venue.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_venue.destroy
  end

  private

  def user_venue_params
    params.require(:user_venue).permit(:user_id, :venue_id, :visited)
  end

end
