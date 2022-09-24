class Api::V1::SessionsController < ApplicationController

    def create 
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            render json: UserSerializer.new(user), status: 200
        else  
            render json: { error: "bad request" }, status: 401
        end 
    end 

end 