class Weather_at_eta
    attr_reader :temperature, 
                :conditions

    def initialize(data, directions)
        if directions.travel_time[:days] == 0 && directions.travel_time[:hours] == 0
            @temperature = data[:current][:temp] 
            @conditions = data[:current][:weather].first[:description]
        elsif directions.travel_time[:days] == 0 && directions.travel_time[:hours] >= 1
            @temperature = data[:hourly][directions.travel_time[:hours]][:temp]
            @conditions = data[:hourly][directions.travel_time[:hours]][:weather].first[:description]
        else 
            @temperature = data[:daily][directions.travel_time[:days]][:temp][:day]
            @conditions = data[:daily][directions.travel_time[:days]][:weather].first[:description]
        end 
    end

end 