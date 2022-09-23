require 'rails_helper'

RSpec.describe BaseService do
  describe '#map_quest_connection' do
    it 'returns a response' do
      service = BaseService.map_quest_conn 

      expect(service).to be_a(Object)
    end
  end

  describe '#open_weather_connection' do
    it 'returns a response' do
      service = BaseService.open_weather_conn

      expect(service).to be_a(Object)
    end
  end
end