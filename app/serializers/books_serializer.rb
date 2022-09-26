class BooksSerializer(destination, forecast, book_hash)
    {
  "data": {
    "id": "null",
    "type": "books",
    "attributes": {
      "destination": "#{destination}",
      "forecast": forecast,
      "total_books_found": book_hash[:total_books],
      binding.pry 
    #   "books": [book_hash[:books].map { |book| "isbn": book.isbn, "title": book.title, "publisher": book.publisher}]
    }
}
    }
end