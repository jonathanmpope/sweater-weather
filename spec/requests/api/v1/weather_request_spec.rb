require 'rails_helper'

describe 'Weather API', :vcr do
    it 'can return the weather for a city' do
        get "/api/v1/forecast?location=denver,co"

        expect(response).to be_successful

        weather = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(weather).to have_key(:id)
        expect(message[:id]).to eq(null)

        expect(message).to have_key(:type)
        expect(message[:type]).to eq("weather")

        expect(message).to have_key(:attributes)

        expect(weather[:attributes]).to have_key(:current_weather)
        expect(weather[:attributes][:current_weather]).to be_a Hash

        expect(weather[:attributes]).to have_key(:daily_weather)
        expect(weather[:attributes][:daily_weather]).to be_a Array 
        expect(weather[:attributes][:daily_weather].count).to eq(5)

        expect(weather[:attributes]).to have_key(:hourly_weather)
        expect(weather[:attributes][:hourly_weather]).to be_a Array
        expect(weather[:attributes][:hourly_weather].count).to eq(8)

        expect(weather[:attributes][:current_weather]).to contain_exactly(:datetime, :sunrise, :sunset, :temperature, :feels_like, 
                                                                            :humidity, :uvi, :visibility, :conditions, :icon)

        expect(weather[:attributes][:current_weather][:datetime]).to be_a String
        expect(weather[:attributes][:current_weather][:sunrise]).to be_a String
        expect(weather[:attributes][:current_weather][:sunset]).to be_a String
        expect(weather[:attributes][:current_weather][:temperature]).to be_a Float
        expect(weather[:attributes][:current_weather][:feels_like]).to be_a Float
        expect(weather[:attributes][:current_weather][:humidity]).to be_a Float or be_a Integer
        expect(weather[:attributes][:current_weather][:uvi]).to be_a Float or be_a Integer
        expect(weather[:attributes][:current_weather][:visibility]).to be_a Float or be_a Integer
        expect(weather[:attributes][:current_weather][:conditions]).to be_a String
        expect(weather[:attributes][:current_weather][:icon]).to be_a String

        expect(weather[:attributes][:daily_weather].first).to contain_exactly(:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon)

        expect(weather[:attributes][:daily_weather].first[:date]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:sunrise]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:sunset]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:max_temp]).to be_a Float
        expect(weather[:attributes][:daily_weather].first[:min_temp]).to be_a Float
        expect(weather[:attributes][:daily_weather].first[:conditions]).to be_a String
        expect(weather[:attributes][:daily_weather].first[:icon]).to be_a String

        expect(weather[:attributes][:hourly_weather].first).to contain_exactly(:time, :temperature, :conditions, :icon)

        expect(weather[:attributes][:hourly_weather].first[:time]).to be_a String
        expect(weather[:attributes][:hourly_weather].first[:temperature]).to be_a Float
        expect(weather[:attributes][:hourly_weather].first[:conditions]).to be_a String
        expect(weather[:attributes][:hourly_weather].first[:icon]).to be_a String
    end 
end
