class UserVenuesController < ApplicationController

  def index
    @user_venues = UserVenue.all

    render json: @user_venues
  end

  def show
    @user_venue = UserVenue.find(params[:id])
    render json: @user_venue
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

  def remove
    @user_venue = UserVenue.find_by(user_id: params[:user_id], venue_id: params[:venue_id])
    @user_venue.destroy

    @user_venues = current_user.venues

    render json: @user_venues
  end

  private

  def user_venue_params
    params.require(:user_venue).permit(:user_id, :venue_id, :visited)
  end

end
