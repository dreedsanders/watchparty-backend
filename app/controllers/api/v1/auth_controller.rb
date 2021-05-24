class Api::V1::AuthController < ApplicationController
    def login 
        # byebug
        user = User.find_by(name: auth_param[:name])
        if user && user.authenticate(auth_param[:password])
            render json: {user: user, profile_picture: user.profile_picture, name: user.name, token: JWT.encode({user_id: user.id}, "LordStrings")}
        else 
            render json: {error: "Incorrect name or password"}
        end


    end

    def auth_param
        params.require(:auth).permit(:name, :password)
    end

  
end
