require "rails_helper"

RSpec.describe Hourlyweather do
    it "exists" do 
        data = {
            "dt": 1663966800,
            "temp": 80.73,
            "feels_like": 78.94,
            "pressure": 1014,
            "humidity": 18,
            "dew_point": 33.33,
            "uvi": 4.81,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 12.71,
            "wind_deg": 322,
            "wind_gust": 18.1,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        }

        daily = Hourlyweather.new(data)

        expect(daily).to be_a Hourlyweather
        expect(daily.time).to eq("03:00:00 PM")
        expect(daily.temperature).to eq(80.73)
        expect(daily.conditions).to eq("clear sky")
        expect(daily.icon).to eq("01d")
    end 
end 