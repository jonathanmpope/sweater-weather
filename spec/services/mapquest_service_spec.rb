require 'rails_helper'

RSpec.describe MapquestService do
  describe '#get_coordinates' do
    it 'returns coordinates for a location', :vcr do
        response = MapquestService.get_coordinates("denver,CO")
        
        expect(response).to be_a Hash

        expect(response[:results]).to be_a Array

        expect(response[:results].first).to be_a Hash 
        expect(response[:results].first).to have_key :locations 
        expect(response[:results].first[:locations]).to be_a Array 

        expect(response[:results].first[:locations].first).to be_a Hash
        expect(response[:results].first[:locations].first).to have_key :latLng  
        expect(response[:results].first[:locations].first[:latLng]).to be_a Hash  

        expect(response[:results].first[:locations].first[:latLng]).to have_key :lat 
        expect(response[:results].first[:locations].first[:latLng]).to have_key :lng 
        expect(response[:results].first[:locations].first[:latLng][:lat]).to be_a Float 
        expect(response[:results].first[:locations].first[:latLng][:lng]).to be_a Float  
    end
  end

  describe '#get_directions' do
    it 'returns directions for a road trip', :vcr do
        response = MapquestService.get_directions("denver,CO", "peublo,CO")
        
        expect(response).to be_a Hash
       
        expect(response[:route]).to be_a Hash

        expect(response[:route]).to be_a Hash 
        expect(response[:route]).to have_key :routeError
        expect(response[:route][:routeError]).to be_a Hash 

        expect(response[:route][:routeError]).to have_key :errorCode
        expect(response[:route][:routeError][:errorCode]).to be_a Integer
        
        expect(response[:route]).to have_key :formattedTime
        expect(response[:route][:formattedTime]).to be_a String
    end
  end
end 