require "rails_helper"

RSpec.describe Directions do
    it "exists" do 
        data = JSON.parse(File.read('spec/fixtures/directions.json'), symbolize_names: true)
        json = data[:route]
        start = "New York, NY" 
        stop = "Los Angeles, CA"
        directions = Directions.new(start, stop, json)

        expect(directions).to be_a Directions
        expect(directions.start_city).to be_a String
        expect(directions.end_city).to be_a String 
        expect(directions.travel_time).to be_a Hash 
    end 
end 