class UsersController < ApplicationController

    def index
      @users = User.all

      render json: @users
    end

    def show
      @user = User.find(params[:id])
      render json: {user: UserSerializer.new(current_user)}
    end

    def create
      @user = User.new(first_name: params['firstName'], last_name: params['lastName'], email: params['username'], password: params['password'])

      if @user.save
        render json: {user: UserSerializer.new(current_user)}
      else

        render json: {error: "Oops! You must include all fields. Must use a valid email."}, status: 422
        # render json: {error: @user.errors}, status: 422
      end
    end

    def update
      if @user.update(user_params)
        render json: {user: UserSerializer.new(current_user)}, status: :ok, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
    end

    private
    #
    #   def set_user
    #     @user = User.find(params[:id])
    #   end
    #
      def user_params
        params.require(:user).permit(:firstName, :lastName, :username, :password)
      end
end
