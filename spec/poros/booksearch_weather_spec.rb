require "rails_helper"

RSpec.describe Booksearchweather do
    it "exists" do 
        data = JSON.parse(File.read('spec/fixtures/forecast.json'), symbolize_names: true)

        weather = Booksearchweather.new(data)

        expect(weather).to be_a Booksearchweather
        expect(weather.temperature).to be_a String
        expect(weather.summary).to be_a String 
    end 
end 