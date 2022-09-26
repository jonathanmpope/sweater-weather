class BooksearchService 

    def self.get_info(location)
        response = BaseService.booksearch_conn.get("/search.json?q=#{location}")
        BaseService.get_json(response)
    end

end 