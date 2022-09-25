class MapquestService 

    def self.get_coordinates(location)
        response = BaseService.map_quest_conn.get("/geocoding/v1/address?key=#{ENV['map_key']}&location=#{location}")
        BaseService.get_json(response)
    end

     def self.get_directions(start, stop)
        response = BaseService.map_quest_conn.get("/directions/v2/route?key=#{ENV['map_key']}&to=#{stop}&from=#{start}")
        json = JSON.parse(response.body, symbolize_names: true)
    end 

end 