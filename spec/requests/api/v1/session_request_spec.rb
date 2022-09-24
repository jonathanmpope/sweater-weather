require 'rails_helper'

describe 'Sessions API' do
    it 'allows the FE to create a session if valid credentials are passed in' do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")
         
        body = {
                "email": "whatever12@example.com",
                "password": "password1",
                }

        post "/api/v1/sessions", params: body 

        expect(response).to be_successful

        expect(response.status).to eq(200)
    
        info = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(info).to have_key(:type)
        expect(info[:type]).to eq("user")

        expect(info).to have_key(:attributes)

        expect(info[:attributes]).to have_key(:email)
        expect(info[:attributes][:email]).to be_a String 
        expect(info[:attributes][:email]).to eq user.email 

        expect(info[:attributes]).to have_key(:api_key)
        expect(info[:attributes][:api_key]).to be_a String 
        expect(info[:attributes][:api_key]).to eq user.api_key 
    end 

    it 'returns an error if passwords do not match' do
        user = User.create!(email: "whatever12@example.com", password: "password1", password_confirmation: "password1")

        body = {
                "email": "whatever12@example.com",
                "password": "password1111",
                }

        post "/api/v1/sessions", params: body 

        expect(response).to_not be_successful

        expect(response.status).to eq(422)
    
        info = JSON.parse(response.body, symbolize_names: true)
        
        expect(info).to have_key(:error)
        expect(info[:error]).to be_a String
        expect(info[:error]).to eq("bad request")
    end 
end 