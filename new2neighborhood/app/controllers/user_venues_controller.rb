class UserVenuesController < ApplicationController

  def index
    @user_venues = UserVenues.all

    render json: @user_venues
  end

  def show
  end

  def create
    @user_venues = UserVenues.new(user_venues_params)

    if @user_venues.save
      render :show, status: :created, location: @user_venues
    else
      render json: @user_venues.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_venues.update(user_venues_params)
      render :show, status: :ok, location: @user_venues
    else
      render json: @user_venues.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_venues.destroy
  end

  private

  def user_venues_params
    params.require(:user_venues).permit(:user_id, :venue_id, :visited)
  end

end
