class MapquestFacade

     def self.get_coordinates(location)
        json = MapquestService.get_coordinates(location)
        Coordinates.new(json)
    end 

end 