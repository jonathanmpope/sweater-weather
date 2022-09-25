class MapquestFacade

    def self.get_coordinates(location)
        json = MapquestService.get_coordinates(location)
        Coordinates.new(json)
    end 

    def self.get_directions(start, stop)
        json = MapquestService.get_directions(start, stop)[:route]
        if json[:routeError][:errorCode] != 2 
            Directions.new(start, stop, json)
        else  
            "Impossible"
        end 
    end 
end 