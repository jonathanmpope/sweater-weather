require 'rails_helper'

RSpec.describe OpenweatherService do
  describe '#get_weather' do
    it 'returns weather for a location', :vcr do
        coordinates = MapquestFacade.get_coordinates("denver,CO")
        response = OpenweatherService.get_weather(coordinates)
       
        expect(response).to be_a Hash
        
        expect(response[:current]).to be_a Hash

        expect(response[:current]).to be_a Hash 
        expect(response[:current]).to have_key :dt 
        expect(response[:current][:dt]).to be_a Integer
        
        expect(response[:current]).to have_key :sunrise
        expect(response[:current][:sunrise]).to be_a Integer 

        expect(response[:current]).to have_key :sunset
        expect(response[:current][:sunset]).to be_a Integer 

        expect(response[:current]).to have_key :temp
        expect(response[:current][:temp]).to be_a Float 

        expect(response[:current]).to have_key :feels_like
        expect(response[:current][:feels_like]).to be_a Float

        expect(response[:current]).to have_key :humidity
        expect(response[:current][:humidity]).to be_a Integer

        expect(response[:current]).to have_key :uvi
        expect(response[:current][:uvi]).to be_a Float

        expect(response[:current]).to have_key :weather
        expect(response[:current][:weather]).to be_a Array

        expect(response[:current][:weather].first).to have_key :description
        expect(response[:current][:weather].first[:description]).to be_a String

        expect(response[:current][:weather].first).to have_key :icon
        expect(response[:current][:weather].first[:icon]).to be_a String

        expect(response[:hourly]).to be_a Array

        response[:hourly].each do |hourly|
            expect(hourly).to have_key :dt
            expect(hourly[:dt]).to be_a Integer

            expect(hourly).to have_key :temp  
            expect(hourly[:temp]).to be_a(Float).or be_a(Integer)
               
            expect(hourly).to have_key :weather  
            expect(hourly[:weather]).to be_a Array

            expect(hourly[:weather].first).to have_key :description  
            expect(hourly[:weather].first[:description]).to be_a String 

            expect(hourly[:weather].first).to have_key :icon  
            expect(hourly[:weather].first[:icon]).to be_a String 
        end 

        expect(response[:daily]).to be_a Array

        response[:daily].each do |daily|
            expect(daily).to have_key :dt
            expect(daily[:dt]).to be_a Integer

            expect(daily).to have_key :sunrise
            expect(daily[:sunrise]).to be_a Integer
               
            expect(daily).to have_key :sunset
            expect(daily[:sunset]).to be_a Integer

            expect(daily).to have_key :temp
            expect(daily[:temp]).to be_a Hash 

            expect(daily[:temp]).to have_key :min
            expect(daily[:temp][:min]).to be_a Float

            expect(daily[:temp]).to have_key :max
            expect(daily[:temp][:max]).to be_a Float

            expect(daily[:weather].first).to have_key :description  
            expect(daily[:weather].first[:description]).to be_a String 

            expect(daily[:weather].first).to have_key :icon  
            expect(daily[:weather].first[:icon]).to be_a String 
        end 
    end
  end
end 