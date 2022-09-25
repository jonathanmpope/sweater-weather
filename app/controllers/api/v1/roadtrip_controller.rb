class Api::V1::RoadtripController < ApplicationController

    def create 
        user = User.find_by(api_key: params[:api_key]) 
        if user && params[:origin] != "" && params[:destination] != "" 
            directions = MapquestFacade.get_directions(params[:origin], params[:destination])
            if directions != "Impossible"
                coordinates = MapquestFacade.get_coordinates(params[:destination])
                weather = OpenweatherFacade.get_road_trip_weather(coordinates, directions)
             
                render json: RoadtripSerializer.new(weather), status: 200
            else 
                render json: { error: "impossible" }, status: 401
            end 
        else  
            render json: { error: "bad request" }, status: 401
        end 
    end 

end 