require "rails_helper"

RSpec.describe Roadtrip do
    it "exists" do 
        dir_data = JSON.parse(File.read('spec/fixtures/directions.json'), symbolize_names: true)
        json = dir_data[:route]
        data = JSON.parse(File.read('spec/fixtures/forecast.json'), symbolize_names: true)

        start = "New York, NY" 
        stop = "Los Angeles, CA"
        directions = Directions.new(start, stop, json)
        weather = Weather_at_eta.new(data, directions)
        roadtrip = Roadtrip.new(directions, weather)

        expect(roadtrip).to be_a Roadtrip
        expect(roadtrip.id).to eq nil 
        expect(roadtrip.start_city).to be_a String 
        expect(roadtrip.end_city).to be_a String 
        expect(roadtrip.travel_time).to be_a String 
        expect(roadtrip.weather_at_eta).to be_a Weather_at_eta
    end 
end 