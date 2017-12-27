class AuthController < ApplicationController
    
    def create
        #use email as username
        user = User.find_by(email: params[:username])

        if user.authenticate(params[:password])
            render json: {username: user.email, id: user.id}
        else
            render json: {error: "Oops! We can't find an account with that username or password"}, status: 401
        end
    end

end