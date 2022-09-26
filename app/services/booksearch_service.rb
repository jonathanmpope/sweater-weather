class BooksearchService 

    def self.get_coordinates(location)
        response = BaseService.booksearch_conn.get("/search.json?q=#{location}")
        BaseService.get_json(response)
    end

end 