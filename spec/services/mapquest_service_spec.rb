require 'rails_helper'

RSpec.describe MapquestService do
  describe '#get_coordinates' do
    it 'returns coordinates for a location', :vcr do
        response = MapquestService .get_coordinates("denver,CO")
        
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
end 