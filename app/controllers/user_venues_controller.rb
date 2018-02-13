class UserVenuesController < ApplicationController

  def index
    @user_venues = UserVenue.all

    render json: @user_venues
  end

  def show
    @user_venue = UserVenue.find(params[:id])


    render json: {user: UserSerializer.new(current_user)}
  end

  def create
    @user_venue = UserVenue.new(user_venue_params)
    if @user_venue.save
      render json: {user: UserSerializer.new(@user_venue.user)}, status: :created, location: @user_venue
    else
      render json: {error: "This venue is already in your saved venues."}
    end
  end

  def update
    @user_venue = UserVenue.find(params[:id])
        @user_venue.visited = (params[:visited])
        if @user_venue.save
      render json: {user: UserSerializer.new(@user_venue.user)}, status: :ok, location: @user_venue
    else
      render json: @user_venue.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_venue.destroy

    render json: {user: UserSerializer.new(current_user)}
  end

  private

  def user_venue_params
    params.require(:user_venue).permit(:user_id, :venue_id, :visited)
  end

end
