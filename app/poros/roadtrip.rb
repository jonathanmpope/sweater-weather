class Roadtrip
    attr_reader :id, 
                :start_city, 
                :end_city, 
                :travel_time,
                :weather 

    def initialize(directions, weather)
        binding.pry 
        @id = nil 
        @start_city = directions
        @end_city = directions 
        @travel_time = directions 
        @weather_at_eta = weather 
    end

end 