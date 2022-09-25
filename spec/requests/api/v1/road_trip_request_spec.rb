require 'rails_helper'

describe 'Roadtrip API', :vcr do
    it 'can return roadtrip data' do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")

        body = 
            {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "api_key": "#{user.api_key}"
            }
            
        post "/api/v1/roadtrip", params: body 

        expect(response).to be_successful

        roadtrip = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(roadtrip).to have_key(:id)
        expect(roadtrip[:id]).to eq(nil)

        expect(roadtrip).to have_key(:type)
        expect(roadtrip[:type]).to eq("roadtrip")

        expect(roadtrip).to have_key(:attributes)
        expect(roadtrip[:attributes]).to be_a Hash 

        expect(roadtrip[:attributes]).to have_key(:start_city)
        expect(roadtrip[:attributes][:start_city]).to be_a String 
        expect(roadtrip[:attributes][:start_city]).to eq "Denver,CO"

        expect(roadtrip[:attributes]).to have_key(:end_city)
        expect(roadtrip[:attributes][:end_city]).to be_a String 
        expect(roadtrip[:attributes][:end_city]).to eq "Pueblo,CO"

        expect(roadtrip[:attributes]).to have_key(:travel_time)
        expect(roadtrip[:attributes][:travel_time]).to be_a String 

        expect(roadtrip[:attributes]).to have_key(:weather_at_eta)
        expect(roadtrip[:attributes][:weather_at_eta]).to be_a Hash  

        expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(roadtrip[:attributes][:weather_at_eta][:temperature]).to be_a(Float).or be_a(Integer)

        expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(roadtrip[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end 

    it 'can deal with a long roadtrip' do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")

        body = 
            {
            "origin": "New York,NY",
            "destination": "Los Angeles,CA",
            "api_key": "#{user.api_key}"
            }
            
        post "/api/v1/roadtrip", params: body 

        expect(response).to be_successful

        roadtrip = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(roadtrip).to have_key(:id)
        expect(roadtrip[:id]).to eq(nil)

        expect(roadtrip).to have_key(:type)
        expect(roadtrip[:type]).to eq("roadtrip")

        expect(roadtrip).to have_key(:attributes)
        expect(roadtrip[:attributes]).to be_a Hash 

        expect(roadtrip[:attributes]).to have_key(:start_city)
        expect(roadtrip[:attributes][:start_city]).to be_a String 
        expect(roadtrip[:attributes][:start_city]).to eq "New York,NY"

        expect(roadtrip[:attributes]).to have_key(:end_city)
        expect(roadtrip[:attributes][:end_city]).to be_a String 
        expect(roadtrip[:attributes][:end_city]).to eq "Los Angeles,CA"

        expect(roadtrip[:attributes]).to have_key(:travel_time)
        expect(roadtrip[:attributes][:travel_time]).to be_a String 

        expect(roadtrip[:attributes]).to have_key(:weather_at_eta)
        expect(roadtrip[:attributes][:weather_at_eta]).to be_a Hash  

        expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(roadtrip[:attributes][:weather_at_eta][:temperature]).to be_a(Float).or be_a(Integer)

        expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(roadtrip[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it 'cannot compute impossible trips' do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")

        body = 
            {
            "origin": "New York, NY",
            "destination": "London, England",
            "api_key": "#{user.api_key}"
            }
            
        post "/api/v1/roadtrip", params: body 

        expect(response).to_not be_successful

        result = JSON.parse(response.body, symbolize_names: true)
         
        expect(result).to have_key(:error)
        expect(result[:error]).to eq("impossible")
    end 

    it 'can deal with a wrong api' do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")

        body = 
            {
            "origin": "New York, NY",
            "destination": "Denver,CO",
            "api_key": "abcdefgi"
            }
            
        post "/api/v1/roadtrip", params: body 

        expect(response).to_not be_successful

        result = JSON.parse(response.body, symbolize_names: true)
         
        expect(result).to have_key(:error)
        expect(result[:error]).to eq("bad request")
    end 

end 