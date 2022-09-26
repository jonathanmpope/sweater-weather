class Api::V1::BooksearchController < ApplicationController

    def create 
        user = User.find_by(api_key: params[:api_key]) 
        if user && params[:location] != nil && params[:quantity] != nil 
            coordinates = MapquestFacade.get_coordinates(params[:location])
            directions = 'booksearch'
            forecast = OpenweatherFacade.get_road_trip_weather(coordinates, directions)
            book_hash = BooksearchFacade.get_info(params[:location], params[:quantity])
            destination = params[:location]
             
            render json: BooksSerializer.book_json(destination, forecast, book_hash), status: 200
        else 
            render json: { error: "bad request: api key, location, and quantity must be provided" }, status: 422
        end 
    end 

end