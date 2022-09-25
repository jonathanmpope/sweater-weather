require "rails_helper"

RSpec.describe Weather_at_eta do
    it "exists" do 
        dir_data = JSON.parse(File.read('spec/fixtures/directions.json'), symbolize_names: true)
        json = dir_data[:route]

        data = JSON.parse(File.read('spec/fixtures/forecast.json'), symbolize_names: true)

        start = "New York, NY" 
        stop = "Los Angeles, CA"
        directions = Directions.new(start, stop, json)

        weather = Weather_at_eta.new(data, directions)

        expect(weather).to be_a Weather_at_eta
        expect(weather.temperature).to be_a Float
        expect(weather.conditions).to be_a String 
    end 
end 