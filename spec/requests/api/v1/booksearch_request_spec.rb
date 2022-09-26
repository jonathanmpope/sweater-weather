require 'rails_helper'

describe 'Booksearch API' do
    it 'can return books data', :vcr do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")

        get "/api/v1/book-search?location=denver,co&quantity=5&api_key=#{user.api_key}"

        expect(response).to be_successful

        books = JSON.parse(response.body, symbolize_names: true)[:data]
      
        expect(books).to have_key(:id)
        expect(books[:id]).to eq(nil)

        expect(books).to have_key(:type)
        expect(books[:type]).to eq("books")

        expect(books).to have_key(:attributes)
        expect(books[:attributes]).to be_a Hash 

        expect(books[:attributes]).to have_key(:destination)
        expect(books[:attributes][:destination]).to be_a String 
        expect(books[:attributes][:destination]).to eq "denver,co"

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

        expect(books[:attributes][:books].first).to_not have_key(:type)
        expect(books[:attributes][:books].first).to_not have_key(:edition_count)
        expect(books[:attributes][:books].first).to_not have_key(:seed)
        expect(books[:attributes][:books].first).to_not have_key(:key)
        expect(books[:attributes][:books].first).to_not have_key(:edition_key)
        expect(books[:attributes][:books].first).to_not have_key(:publish_date)
        expect(books[:attributes][:books].first).to_not have_key(:publish_year)
        expect(books[:attributes][:books].first).to_not have_key(:first_publish_year)
        expect(books[:attributes][:books].first).to_not have_key(:last_midified_i)
        expect(books[:attributes][:books].first).to_not have_key(:ebook_count_i)
        expect(books[:attributes][:books].first).to_not have_key(:ebook_access)
        expect(books[:attributes][:books].first).to_not have_key(:has_fulltext)
        expect(books[:attributes][:books].first).to_not have_key(:publish_scan_b)
        expect(books[:attributes][:books].first).to_not have_key(:language)
        expect(books[:attributes][:books].first).to_not have_key(:author_name)
    end 

    it 'can can deal with a missing search param', :vcr do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")
        get "/api/v1/book-search?quantity=5&api_key=#{user.api_key}"

        expect(response).to_not be_successful

        expect(response.status).to eq 422

        result = JSON.parse(response.body, symbolize_names: true) 

        expect(result).to have_key(:error)
        expect(result[:error]).to eq("bad request: api key, location, and quantity must be provided")
    end 

    it 'can can deal with a missing quantity param', :vcr do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")
        get "/api/v1/book-search?location=denver,co&api_key=#{user.api_key}"

        expect(response).to_not be_successful

        expect(response.status).to eq 422

        result = JSON.parse(response.body, symbolize_names: true) 

        expect(result).to have_key(:error)
        expect(result[:error]).to eq("bad request: api key, location, and quantity must be provided")
    end 

    it 'can can deal with a missing api key', :vcr do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")
        get "/api/v1/book-search?location=denver,co&quantity=5"

        expect(response).to_not be_successful

        expect(response.status).to eq 422

        result = JSON.parse(response.body, symbolize_names: true) 

        expect(result).to have_key(:error)
        expect(result[:error]).to eq("bad request: api key, location, and quantity must be provided")
    end 
end 