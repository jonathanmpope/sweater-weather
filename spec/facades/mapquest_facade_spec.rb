require 'rails_helper'

RSpec.describe MapquestFacade do
    describe "#get_coordinates" do
        it 'returns a Coordinate', :vcr do 
            results = MapquestFacade.get_coordinates("denver,CO")

            expect(results).to be_a Coordinates 
        end 
    end
    
    describe "#get_directions" do
        it 'returns directions', :vcr do 
            results = MapquestFacade.get_directions("denver,CO", "peublo,CO")

            expect(results).to be_a Directions
        end 
    end 
end 
