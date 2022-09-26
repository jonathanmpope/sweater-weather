class Api::V1::WeatherController < ApplicationController

    def show 
        if params[:location] != nil && params[:location] != ""
            coordinates = MapquestFacade.get_coordinates(params[:location])
            weather = OpenweatherFacade.get_weather(coordinates) 

            render json: WeatherSerializer.new(weather), status: 200
        else 
            render json: { error: "location required" }, status: 404
        end 
    end 

end