class BooksSerializer
    def self.book_json(destination, forecast, book_hash) 
        {
        data: {
            id: nil,
            type: "books",
            attributes: {
            destination: "#{destination}",
            forecast: forecast,
            total_books_found: book_hash[:total_books],
              books: 
                    book_hash[:books].map do |book|
                        { isbn: book.isbn, title: book.title, publisher: book.publisher}
                    end 
                }
            }
        }
    end 
end