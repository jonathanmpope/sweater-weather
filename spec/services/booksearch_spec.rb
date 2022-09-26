require 'rails_helper'

RSpec.describe BooksearchService  do
    describe '#get_info' do
        it 'returns book data', :vcr do
            response = BooksearchService.get_info("denver,CO")
            
            expect(response).to be_a Hash

            expect(response[:numFound]).to be_a Integer
            expect(response[:docs]).to be_a Array

            expect(response[:docs].first).to be_a Hash

            expect(response[:docs].first[:title]).to be_a String
            expect(response[:docs].first[:isbn]).to be_a Array
            expect(response[:docs].first[:publisher]).to be_a Array
        end
    end
end 