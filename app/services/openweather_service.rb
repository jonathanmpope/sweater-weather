class OpenweatherService 

    def self.get_weather(coordinates)
        response = BaseService.open_weather_conn.get("/data/3.0/onecall?lat=#{coordinates.latitude}&lon=#{coordinates.longitude}&exclude=minutely&appid=#{ENV['open_key']}&units=imperial")
        BaseService.get_json(response)
    end

end 