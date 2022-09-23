require 'rails_helper'

describe 'Weather API' do
    it 'can return the weather for a city' do

        get "/api/v1/satellites/find_by_user_id?user_id=#{user1.id}"

        expect(response).to be_successful

    end 
end
