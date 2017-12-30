class AuthController < ApplicationController

    def create
        # POST request to the '/auth' route
        # use email as username
        user = User.find_by(email: params[:username])

        if user && user.authenticate(params[:password])
            render json: {firstName: user.first_name, lastName: user.last_name, username: user.email, id: user.id, token: issue_token({id: user.id})}
        else
            render json: {error: "Oops! We can't find an account with that username and password."}, status: 401
        end
    end

    def show
        # GET request to the'/current_user' route
        # Requires headers to contain 'Authorization': token
        if current_user
            render json: {username: user.email, id: user.id}
        else
            render json: {error: "Invalid token"}, status: 401
        end
    end
end
