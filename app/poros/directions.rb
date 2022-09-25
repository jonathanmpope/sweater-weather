class Directions
    attr_reader :start_city,
                :end_city,
                :travel_time

    def initialize(start, stop, data)
        @start_city = start
        @end_city = stop 
        @travel_time = days_hours_minutes(data[:formattedTime])
    end

    def days_hours_minutes(time)
        time_hash = {}
        time_hash[:days] = time[0..1].to_i / 24
        time_hash[:hours] = time[0..1].to_i % 24
        time_hash[:minutes] = time[-2..-1].to_i
        time_hash
    end 
end 