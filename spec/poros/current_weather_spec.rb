require "rails_helper"

RSpec.describe Currentweather do
    it "exists" do 
        data = 

 {
        "dt": 1663962119,
        "sunrise": 1663937311,
        "sunset": 1663980964,
        "temp": 78.98,
        "feels_like": 78.98,
        "pressure": 1014,
        "humidity": 20,
        "dew_point": 34.54,
        "uvi": 6.38,
        "clouds": 0,
        "visibility": 10000,
        "wind_speed": 11.01,
        "wind_deg": 318,
        "weather": [
            {
                "id": 800,
                "main": "Clear",
                "description": "clear sky",
                "icon": "01d"
            }
        ]
    }

        current = Currentweather.new(data)

        expect(current).to be_a Currentweather
        expect(current.datetime).to eq("2022-09-23 13:41:59 -0600")
        expect(current.sunrise).to eq("2022-09-23 06:48:31 -0600")
        expect(current.sunset).to eq("2022-09-23 18:56:04 -0600")
        expect(current.temperature).to eq(78.98)
        expect(current.feels_like).to eq(78.98)
        expect(current.humidity).to eq(20)
        expect(current.uvi).to eq(6.38)
        expect(current.visibility).to eq(10000)
        expect(current.conditions).to eq("clear sky")
        expect(current.icon).to eq("01d")
    end 
end 