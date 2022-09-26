class Booksearchweather
    attr_reader :temperature, 
                :summary

    def initialize(data)
        @temperature = "#{(data[:current][:temp].to_i)} F"
        @summary = data[:current][:weather].first[:description]
    end

end 