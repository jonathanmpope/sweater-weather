require 'rails_helper'

describe 'User API' do
    it 'allows the FE to create users and return an API key' do
        body = {
                "email": "whatever12@example.com",
                 "password": "password1",
                "password_confirmation": "password1"
                }

        post "/api/v1/users", params: body 

        # post "/api/v1/users?email=test@test.com"

        expect(response).to be_successful

        expect(response.status).to eq(201)
    
        info = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(info).to have_key(:type)
        expect(info[:type]).to eq("user")

        expect(info).to have_key(:attributes)

        expect(info[:attributes]).to have_key(:email)
        expect(info[:attributes][:email]).to be_a String 

        expect(info[:attributes]).to have_key(:api_key)
        expect(info[:attributes][:api_key]).to be_a String 
    end 
end 