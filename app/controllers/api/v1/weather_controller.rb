class Api::V1::WeatherController < ApplicationController

    def show 
        if params[:location] != ""
            coordinates = MapquestFacade.get_coordinates(params[:location])
            binding.pry 
            weather = OpenweatherFacade.get_weather(coordinates)

            render json: WeatherSerializer.new(weather)
        else 
            render json: { error: "location required" }, status: 404
        end 
    end 

end