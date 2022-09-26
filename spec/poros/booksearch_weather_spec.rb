require "rails_helper"

RSpec.describe Booksearchweather do
    it "exists" do 
        # dir_data = JSON.parse(File.read('spec/fixtures/directions.json'), symbolize_names: true)
        # json = dir_data[:route]

        data = JSON.parse(File.read('spec/fixtures/forecast.json'), symbolize_names: true)

        weather = Booksearchweather.new(data)

        expect(weather).to be_a Booksearchweather
        expect(weather.temperature).to be_a String
        expect(weather.summary).to be_a String 
    end 
end 