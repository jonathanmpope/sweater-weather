class BooksearchFacade

    def self.get_info(location, quantity) 
        if quantity.to_i.class == Integer && quantity.to_i > 0
            json = BooksearchService.get_info(location) 
            book_hash = {}
            book_hash[:total_books] = json[:numFound]
            book_hash[:books] = json[:docs][0..(quantity.to_i - 1)].map { |d| Books.new(d) }
            book_hash
        else 
            "You must submit an integer like 5"
        end 
    end 
end 