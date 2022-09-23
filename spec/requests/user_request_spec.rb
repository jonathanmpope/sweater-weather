require 'rails_helper'

describe 'User API', :vcr do
    it 'allows the FE to create users and return an API key' do
        body = {
                "email": "whatever@example.com",
                 "password": "password",
                "password_confirmation": "password"
                }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users", headers: headers, params: JSON.generate(message: message_params)

        expect(reponse).to be_successful

        expect(response.status).to eq(201)

        response = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(response).to have_key(:type)
        expect(response[:type]).to eq("users")

        expect(response).to have_key(:attributes)

        expect(response[:attributes]).to have_key(:email)
        expect(weather[:attributes][:email]).to be_a string 

        expect(response[:attributes]).to have_key(:api_key)
        expect(weather[:attributes][:api_key]).to be_a string 
    end 
end 