class Roadtrip
    attr_reader :id, 
                :start_city, 
                :end_city, 
                :travel_time,
                :weather_at_eta

    def initialize(directions, weather)
        @id = nil 
        @start_city = directions.start_city
        @end_city = directions.end_city 
        @travel_time = "#{directions.travel_time[:days]} days, #{directions.travel_time[:hours]} hours, #{directions.travel_time[:minutes]} minutes"
        @weather_at_eta = weather 
    end

end 