class BaseService

    def self.open_weather_conn
        Faraday.new(url: 'https://api.openweathermap.org/')
    end 

    def self.map_quest_conn 
        Faraday.new(url: 'http://www.mapquestapi.com/')
    end 

    def self.get_json(response)
        JSON.parse(response.body, symbolize_names: true)
    end 

end 