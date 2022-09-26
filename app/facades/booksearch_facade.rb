class BooksearchFacade

    def self.get_info(location, quantity)
        json = BooksearchService.get_info(location)
        binding.pry 
        book_hash = {}
        book_hash[:total_books] = json[:numFound]
        book_hash[:books] = json[:docs][0..(quantity -1)].map { |d| Books.new(d) }
        book_hash 
    end 
end 