require 'rails_helper'

describe 'Booksearch API', :vcr do
    it 'can return books data' do
        get "/api/v1/book-search?location=denver,co&quantity=5"

        expect(response).to be_successful

        books = JSON.parse(response.body, symbolize_names: true)[:data]
        binding.pry 
        expect(books).to have_key(:id)
        expect(books[:id]).to eq(nil)

        expect(books).to have_key(:type)
        expect(books[:type]).to eq("books")

        expect(books).to have_key(:attributes)
        expect(books[:attributes]).to be_a Hash 

        expect(books[:attributes]).to have_key(:destination)
        expect(books[:attributes][:destination]).to be_a String 
        expect(books[:attributes][:start_city]).to eq "denver,co"

        expect(books[:attributes]).to have_key(:forecast)
        expect(books[:attributes][:forecast]).to be_a Hash 

        expect(books[:attributes][:forecast]).to have_key(:summary)
        expect(books[:attributes][:forecast][:summary]).to be_a String 

         expect(books[:attributes][:forecast]).to have_key(:temperature)
        expect(books[:attributes][:forecast][:temperature]).to be_a String 

        expect(books[:attributes]).to have_key(:total_books_found)
        expect(books[:attributes][:total_books_found]).to be_a Integer

        expect(books[:attributes]).to have_key(:books)
        expect(books[:attributes][:books]).to be_a Array
        expect(books[:attributes][:books].count).to eq 5

        expect(books[:attributes][:books].first).to have_key(:isbn)
        expect(books[:attributes][:books].first[:isbn]).to be_a Array  

        expect(books[:attributes][:books].first).to have_key(:title)
        expect(books[:attributes][:books].first[:title]).to be_a String  

        expect(books[:attributes][:books].first).to have_key(:publisher)
        expect(books[:attributes][:books].first[:publisher]).to be_a Array 
    end 
end 