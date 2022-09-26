class Api::V1::BooksearchController < ApplicationController

    def create 
        if params[:location] != nil && params[:quantity] != nil 
            coordinates = MapquestFacade.get_coordinates(params[:location])
            weather = OpenweatherFacade.get_booksearch_weather(coordinates)
            binding.pry 
            books = BooksearchFacade.get_info(params[:location], params[:quantity])

            render json: BooksSerializer.new(weather, books), status: 200
        else 
            render json: { error: "something" }, status: 404
        end 
    end 

end