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

    it 'returns an error if passwords do not match' do
        body = {
                "email": "whatever12345@example.com",
                "password": "password",
                "password_confirmation": "password1"
                }

        post "/api/v1/users", params: body 

        expect(response).to_not be_successful

        expect(response.status).to eq(422)
    
        info = JSON.parse(response.body, symbolize_names: true)
       
        expect(info).to have_key(:error)
        expect(info[:error]).to be_a Hash 

        expect(info[:error]).to have_key(:password_confirmation)
        expect(info[:error][:password_confirmation]).to eq(["doesn't match Password"])
    end 

    it 'returns an error if data is missing' do
        body = {
                "email": "whatever123456@example.com",
                "password": "password",
                }

        post "/api/v1/users", params: body 

        expect(response).to_not be_successful

        expect(response.status).to eq(422)
    
        info = JSON.parse(response.body, symbolize_names: true)
       
        expect(info).to have_key(:error)
        expect(info[:error]).to be_a Hash 
           
        expect(info[:error]).to have_key(:password_confirmation)
        expect(info[:error][:password_confirmation]).to eq(["can't be blank"])
    end 

    it 'will not create a user if email is already taken' do
        body = {
                "email": "whatever12@example.com",
                 "password": "password1",
                "password_confirmation": "password1"
                }

        post "/api/v1/users", params: body 

        body = {
                "email": "whatever12@example.com",
                 "password": "password1",
                "password_confirmation": "password1"
                }

        post "/api/v1/users", params: body 

        expect(response).to_not be_successful

        expect(response.status).to eq(422)
    
        info = JSON.parse(response.body, symbolize_names: true)
       
        expect(info).to have_key(:error)
        expect(info[:error]).to be_a Hash 
           
        expect(info[:error]).to have_key(:email)
        expect(info[:error][:email]).to eq(["has already been taken"])
    end 
end 