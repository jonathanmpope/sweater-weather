class OpenweatherFacade

     def self.get_weather(coordinates)
        json = OpenweatherService.get_weather(coordinates)
        current = Currentweather.new(json[:current])
        binding.pry 
        daily = json[:daily][0..4].map { |d| Dailyweather.new(d) }
        hourly = json[:hourly][0..7].map { |d| Hourlyweather.new(d) }
        Forecast.new(current, daily, hourly)
    end 

end 