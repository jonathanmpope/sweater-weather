class Weather_at_eta
    attr_reader :temperature, 
                :conditions

    def initialize(data, directions)
        if directions.travel_time.include?("0 days") && directions.travel_time.include?("0 hours")
            @temperature = data 
            @conditions = data 
        elsif directions.travel_time.include?("0 days") && directions.travel_time.exclude?("0 hours")
            @temperature = data 
            @conditions = data 
        else 
            @temperature = data 
            @conditions = data 
        end 
    end

end 