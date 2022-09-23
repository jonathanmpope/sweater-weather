class MapquestService 

    def self.get_coordinates(location)
        response = BaseService.map_quest_conn.get("/geocoding/v1/address?key=#{ENV['map_key']}&location=#{location}")
        BaseService.get_json(response)
    end

end 