class OpenweatherFacade

     def self.get_weather(coordinates)
        json = OpenweatherService.get_weather(coordinates)
        current = Currentweather.new(json[:current])
        hourly = json[:hourly][0..7].map { |d| Hourlyweather.new(d) }
        daily = json[:daily][0..4].map { |d| Dailyweather.new(d) }
        Forecast.new(current, hourly, daily)
    end 

    def self.get_road_trip_weather(coordinates, directions)
        json = OpenweatherService.get_weather(coordinates)
        weather = Weather_at_eta.new(json, directions)
        Roadtrip.new(directions, weather)
    end 

end 