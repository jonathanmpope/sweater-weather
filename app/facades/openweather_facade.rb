class OpenweatherFacade

     def self.get_weather(coordinates)
        json = OpenweatherService.get_weather(coordinates)
        current = Currentweather.new(json[:current])
        hourly = json[:hourly][0..7].map { |d| Hourlyweather.new(d) }
        daily = json[:daily][0..4].map { |d| Dailyweather.new(d) }
        Forecast.new(current, hourly, daily)
    end 

end 