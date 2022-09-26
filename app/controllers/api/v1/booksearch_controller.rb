class Api::V1::BooksearchController < ApplicationController

    def create 
        if params[:location] != nil && params[:quantity] != nil 
            coordinates = MapquestFacade.get_coordinates(params[:location])
            forecast = OpenweatherFacade.get_booksearch_weather(coordinates)
            book_hash = BooksearchFacade.get_info(params[:location], params[:quantity])
            destination = params[:location]
             
            render json: BooksSerializer.book_json(destination, forecast, book_hash), status: 200
        else 
            render json: { error: "bad request: missing data" }, status: 422
        end 
    end 

end