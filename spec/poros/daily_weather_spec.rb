require "rails_helper"

RSpec.describe Dailyweather do
    it "exists" do 
        data = {
            "dt": 1663956000,
            "sunrise": 1663937311,
            "sunset": 1663980964,
            "moonrise": 1663928280,
            "moonset": 1663978740,
            "moon_phase": 0.93,
            "temp": {
                "day": 79.23,
                "min": 58.73,
                "max": 81.25,
                "night": 67.46,
                "eve": 80.51,
                "morn": 58.98
            },
            "feels_like": {
                "day": 79.23,
                "night": 64.8,
                "eve": 78.55,
                "morn": 56.61
            },
            "pressure": 1012,
            "humidity": 13,
            "dew_point": 25.09,
            "wind_speed": 14.38,
            "wind_deg": 300,
            "wind_gust": 21.68,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 6.97
        }

        daily = Dailyweather.new(data)

        expect(daily).to be_a Dailyweather
        expect(daily.date).to eq("09/23/2022")
        expect(daily.sunrise).to eq("2022-09-23 06:48:31 -0600")
        expect(daily.sunset).to eq("2022-09-23 18:56:04 -0600")
        expect(daily.max_temp).to eq(81.25)
        expect(daily.min_temp).to eq(58.73)
        expect(daily.conditions).to eq("clear sky")
        expect(daily.icon).to eq("01d")
    end 
end 