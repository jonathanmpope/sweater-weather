require "rails_helper"

RSpec.describe Forecast do
    it "exists" do 
        json = JSON.parse(File.read('spec/fixtures/forecast.json'), symbolize_names: true)
         
        current = Currentweather.new(json[:current])
        hourly = json[:hourly][0..7].map { |d| Hourlyweather.new(d) }
        daily = json[:daily][0..4].map { |d| Dailyweather.new(d) }
        forecast = Forecast.new(current, hourly, daily)

        expect(forecast).to be_a Forecast
        expect(forecast.current_weather).to be_a Currentweather
        expect(forecast.daily_weather).to be_a Array
        expect(forecast.daily_weather.count).to eq 5
        expect(forecast.daily_weather.first).to be_a Dailyweather
        expect(forecast.hourly_weather).to be_a Array
        expect(forecast.hourly_weather.count).to eq 8
        expect(forecast.hourly_weather.first).to be_a Hourlyweather
    end 
end 