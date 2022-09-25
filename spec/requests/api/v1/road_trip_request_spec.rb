require 'rails_helper'

describe 'Roadtrip API', :vcr do
    it 'can return the weather for a city' do
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
        expect(weather[:id]).to eq(nil)

        expect(roadtrip).to have_key(:type)
        expect(weather[:type]).to eq("roadtrip")

        expect(roadtrip).to have_key(:attributes)
        expect(weather[:attributes]).to be_a Hash 

        expect(info[:attributes]).to have_key(:start_city)
        expect(info[:attributes][:start_city]).to be_a String 
        expect(info[:attributes][:start_city]).to eq "Denver, CO"

        expect(info[:attributes]).to have_key(:end_city)
        expect(info[:attributes][:end_city]).to be_a String 
        expect(info[:attributes][:end_city]).to eq "Pueblo, CO"

        expect(info[:attributes]).to have_key(:travel_time)
        expect(info[:attributes][:travel_time]).to be_a String 

        expect(info[:attributes]).to have_key(:weather_at_eta)
        expect(info[:attributes][:weather_at_eta]).to be_a Hash  

        expect(info[:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(info[:attributes][:weather_at_eta][:temperature]).to be_a(Float).or be_a(Integer)

        expect(info[:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(info[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end 

end 