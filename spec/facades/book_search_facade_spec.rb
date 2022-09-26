require 'rails_helper'

RSpec.describe BooksearchFacade do
    describe "#get_info" do
        it 'returns book info', :vcr do 
            results = BooksearchFacade.get_info("denver,CO", "5")

            expect(results).to be_a Hash 
            expect(results[:total_books]).to be_a Integer
            expect(results[:books]).to be_a Array
            expect(results[:books]).to be_all Books
        end 
    end

    describe "#get_info - sadpath" do
        it 'returns book info', :vcr do 
            results = BooksearchFacade.get_info("denver,CO", "five")

            expect(results).to be_a String 
            expect(results).to eq "You must submit an integer like 5"
        end 
    end
end 

        