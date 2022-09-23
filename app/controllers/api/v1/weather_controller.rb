class Api::V1::MessagesController < ApplicationController

    def show 
        if params[:location] != ""
            coordinates = MapquestFacade.get_coordinates(params[:location])
            weather = OpenweatherFacade.get_weather(coordinates)

            render json: WeatherSerializer.new(weather)
        else 
            render json: { "location required" } , status: 404
        end 
    end 

end