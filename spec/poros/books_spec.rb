require "rails_helper"

RSpec.describe Books do
    it "exists" do 
        data = JSON.parse(File.read('spec/fixtures/book.json'), symbolize_names: true)

        book = Books.new(data)

        expect(book).to be_a Books
        expect(book.isbn).to be_a Array
        expect(book.title).to be_a String 
        expect(book.publisher).to be_a Array 
    end 
end 