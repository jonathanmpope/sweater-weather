class Booksearchweather
    attr_reader :temperature, 
                :conditions

    def initialize(data)
        @temperature = "#{(data[:current][:temp].to_i)} F"
        @conditions = data[:current][:weather].first[:description]
    end

end 