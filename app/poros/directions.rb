class Directions
    attr_reader :start_city,
                :end_city,
                :travel_time

    def initialize(start, stop, data)
        @start_city = start
        @end_city = stop 
        @travel_time = days_hours_minutes(data[:realTime])
    end

    def days_hours_minutes(seconds)
        time_hash = {}
        time_hash[:days] = seconds / 86_400
        time_hash[:hours] = seconds / 3600 % 24
        time_hash[:minutes] = seconds / 60 % 60 
        time_hash
    end 
end 