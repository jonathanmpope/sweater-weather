class Api::V1::BooksearchController < ApplicationController

    def create 
        if params[:location] != nil && params[:quantity] != nil 
            coordinates = MapquestFacade.get_coordinates(params[:location])
            forecast = OpenweatherFacade.get_booksearch_weather(coordinates)
            book_hash = BooksearchFacade.get_info(params[:location], params[:quantity])
            binding.pry 
            render json: BooksSerializer.new(forecast, book_hash[:total_books], book_hash[:books]), status: 200
        else 
            render json: { error: "something" }, status: 404
        end 
    end 

end