require 'rails_helper'

describe 'Weather API', :vcr do
    it 'can return the weather for a city' do
        get "/api/v1/forecast?location=denver,co"

        expect(response).to be_successful

        weather = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(weather).to have_key(:id)
        expect(weather[:id]).to eq(nil)

        expect(weather).to have_key(:type)
        expect(weather[:type]).to eq("weather")

        expect(weather).to have_key(:attributes)

        expect(weather[:attributes]).to have_key(:current_weather)
        expect(weather[:attributes][:current_weather]).to be_a Hash

        expect(weather[:attributes]).to have_key(:daily_weather)
        expect(weather[:attributes][:daily_weather]).to be_a Array 
        expect(weather[:attributes][:daily_weather].count).to eq(5)

        expect(weather[:attributes]).to have_key(:hourly_weather)
        expect(weather[:attributes][:hourly_weather]).to be_a Array
        expect(weather[:attributes][:hourly_weather].count).to eq(8)

        expect(weather[:attributes][:current_weather].keys).to contain_exactly(:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon)

        expect(weather[:attributes][:current_weather][:datetime]).to be_a String
        expect(weather[:attributes][:current_weather][:sunrise]).to be_a String
        expect(weather[:attributes][:current_weather][:sunset]).to be_a String
        expect(weather[:attributes][:current_weather][:temperature]).to be_a Float
        expect(weather[:attributes][:current_weather][:feels_like]).to be_a Float
        expect(weather[:attributes][:current_weather][:humidity]).to be_a Integer or be_a Float
        expect(weather[:attributes][:current_weather][:uvi]).to be_a Float or be_a Integer
        expect(weather[:attributes][:current_weather][:visibility]).to be_a Integer or be_a Float
        expect(weather[:attributes][:current_weather][:conditions]).to be_a String
        expect(weather[:attributes][:current_weather][:icon]).to be_a String

        expect(weather[:attributes][:daily_weather].first.keys).to contain_exactly(:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon)

        expect(weather[:attributes][:daily_weather].first[:date]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:sunrise]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:sunset]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:max_temp]).to be_a Float
        expect(weather[:attributes][:daily_weather].first[:min_temp]).to be_a Float
        expect(weather[:attributes][:daily_weather].first[:conditions]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:icon]).to be_a String

        expect(weather[:attributes][:hourly_weather].first.keys).to contain_exactly(:time, :temperature, :conditions, :icon)

        expect(weather[:attributes][:hourly_weather].first[:time]).to be_a String
        expect(weather[:attributes][:hourly_weather].first[:temperature]).to be_a Float
        expect(weather[:attributes][:hourly_weather].first[:conditions]).to be_a String
        expect(weather[:attributes][:hourly_weather].first[:icon]).to be_a String
    end
    
    it 'can returns an error if no location is provided' do
        get "/api/v1/forecast?location"

        expect(response).to_not be_successful
        expect(response.status).to eq 404

        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:error]).to eq "location required"
    end 

    it 'can says what is not in the ' do
        get "/api/v1/forecast?location=denver,co"

        weather = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(weather[:attributes][:current_weather].keys).to_not contain_exactly(:pressure, :dew_point, :clouds, :wind_speed, :wind_deg)
        
        expect(weather[:attributes][:daily_weather].first.keys).to_not contain_exactly(:moonrise, :moonset, :moon_phase, :day, :night, :eve, :morn, :pressure, :humidity, :dew_point, :wind_speed, :wind_deg, :wind_gust)
        
        expect(weather[:attributes][:hourly_weather].first.keys).to_not contain_exactly(:pressure, :feels_like, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_deg, :wind_speed, :wind_gust)
    end 
end
