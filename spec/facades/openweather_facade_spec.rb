require 'rails_helper'

RSpec.describe OpenweatherFacade do
    describe "#get_weather" do
        it 'returns the weather', :vcr do
                    data = {
    "info": {
        "statuscode": 0,
        "copyright": {
            "text": "© 2022 MapQuest, Inc.",
            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
            "imageAltText": "© 2022 MapQuest, Inc."
        },
        "messages": []
    },
    "options": {
        "maxResults": -1,
        "thumbMaps": true,
        "ignoreLatLngInput": false
    },
    "results": [
        {
            "providedLocation": {
                "location": "denver,co"
            },
            "locations": [
                {
                    "street": "",
                    "adminArea6": "",
                    "adminArea6Type": "Neighborhood",
                    "adminArea5": "Denver",
                    "adminArea5Type": "City",
                    "adminArea4": "Denver County",
                    "adminArea4Type": "County",
                    "adminArea3": "CO",
                    "adminArea3Type": "State",
                    "adminArea1": "US",
                    "adminArea1Type": "Country",
                    "postalCode": "",
                    "geocodeQualityCode": "A5XAX",
                    "geocodeQuality": "CITY",
                    "dragPoint": false,
                    "sideOfStreet": "N",
                    "linkId": "282041090",
                    "unknownInput": "",
                    "type": "s",
                    "latLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "displayLatLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ee7MHaAV8RNsgNFChrsszAE71lD8YA1X&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=1936097177"
                },
                {
                    "street": "",
                    "adminArea6": "",
                    "adminArea6Type": "Neighborhood",
                    "adminArea5": "",
                    "adminArea5Type": "City",
                    "adminArea4": "Denver County",
                    "adminArea4Type": "County",
                    "adminArea3": "CO",
                    "adminArea3Type": "State",
                    "adminArea1": "US",
                    "adminArea1Type": "Country",
                    "postalCode": "",
                    "geocodeQualityCode": "A4XAX",
                    "geocodeQuality": "COUNTY",
                    "dragPoint": false,
                    "sideOfStreet": "N",
                    "linkId": "282932003",
                    "unknownInput": "",
                    "type": "s",
                    "latLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "displayLatLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ee7MHaAV8RNsgNFChrsszAE71lD8YA1X&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-2&scalebar=true&zoom=9&rand=-281837090"
                }
            ]
        }
    ]
}
    
            coordinates = Coordinates.new(data)
            results = OpenweatherFacade.get_weather(coordinates)
            
            expect(results).to be_a Forecast
            expect(results.current_weather).to be_a Currentweather

            expect(results.daily_weather).to be_a Array
            expect(results.daily_weather.count).to eq 5
            expect(results.daily_weather).to be_all Dailyweather

            expect(results.hourly_weather).to be_a Array
            expect(results.hourly_weather.count).to eq 8 
            expect(results.hourly_weather).to be_all Hourlyweather
        end 
    end 

     describe "#get_road_trip_weather" do
        it 'returns weather at a destination', :vcr do 
            data = {
    "info": {
        "statuscode": 0,
        "copyright": {
            "text": "© 2022 MapQuest, Inc.",
            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
            "imageAltText": "© 2022 MapQuest, Inc."
        },
        "messages": []
    },
    "options": {
        "maxResults": -1,
        "thumbMaps": true,
        "ignoreLatLngInput": false
    },
    "results": [
        {
            "providedLocation": {
                "location": "denver,co"
            },
            "locations": [
                {
                    "street": "",
                    "adminArea6": "",
                    "adminArea6Type": "Neighborhood",
                    "adminArea5": "Denver",
                    "adminArea5Type": "City",
                    "adminArea4": "Denver County",
                    "adminArea4Type": "County",
                    "adminArea3": "CO",
                    "adminArea3Type": "State",
                    "adminArea1": "US",
                    "adminArea1Type": "Country",
                    "postalCode": "",
                    "geocodeQualityCode": "A5XAX",
                    "geocodeQuality": "CITY",
                    "dragPoint": false,
                    "sideOfStreet": "N",
                    "linkId": "282041090",
                    "unknownInput": "",
                    "type": "s",
                    "latLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "displayLatLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ee7MHaAV8RNsgNFChrsszAE71lD8YA1X&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=1936097177"
                },
                {
                    "street": "",
                    "adminArea6": "",
                    "adminArea6Type": "Neighborhood",
                    "adminArea5": "",
                    "adminArea5Type": "City",
                    "adminArea4": "Denver County",
                    "adminArea4Type": "County",
                    "adminArea3": "CO",
                    "adminArea3Type": "State",
                    "adminArea1": "US",
                    "adminArea1Type": "Country",
                    "postalCode": "",
                    "geocodeQualityCode": "A4XAX",
                    "geocodeQuality": "COUNTY",
                    "dragPoint": false,
                    "sideOfStreet": "N",
                    "linkId": "282932003",
                    "unknownInput": "",
                    "type": "s",
                    "latLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "displayLatLng": {
                        "lat": 39.738453,
                        "lng": -104.984853
                    },
                    "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ee7MHaAV8RNsgNFChrsszAE71lD8YA1X&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-2&scalebar=true&zoom=9&rand=-281837090"
                }
            ]
        }
    ]
}
    
            coordinates = Coordinates.new(data)
            directions = MapquestFacade.get_directions("denver,CO", "peublo,CO")
            results = OpenweatherFacade.get_road_trip_weather(coordinates, directions)

            expect(results).to be_a Roadtrip 
        end 
    end

    describe "#get_booksearch_weather" do
        it 'returns the weather for booksearch', :vcr do
                    data = {
                    "info": {
                        "statuscode": 0,
                        "copyright": {
                            "text": "© 2022 MapQuest, Inc.",
                            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
                            "imageAltText": "© 2022 MapQuest, Inc."
                        },
                        "messages": []
                    },
                    "options": {
                        "maxResults": -1,
                        "thumbMaps": true,
                        "ignoreLatLngInput": false
                    },
                    "results": [
                        {
                            "providedLocation": {
                                "location": "denver,co"
                            },
                            "locations": [
                                {
                                    "street": "",
                                    "adminArea6": "",
                                    "adminArea6Type": "Neighborhood",
                                    "adminArea5": "Denver",
                                    "adminArea5Type": "City",
                                    "adminArea4": "Denver County",
                                    "adminArea4Type": "County",
                                    "adminArea3": "CO",
                                    "adminArea3Type": "State",
                                    "adminArea1": "US",
                                    "adminArea1Type": "Country",
                                    "postalCode": "",
                                    "geocodeQualityCode": "A5XAX",
                                    "geocodeQuality": "CITY",
                                    "dragPoint": false,
                                    "sideOfStreet": "N",
                                    "linkId": "282041090",
                                    "unknownInput": "",
                                    "type": "s",
                                    "latLng": {
                                        "lat": 39.738453,
                                        "lng": -104.984853
                                    },
                                    "displayLatLng": {
                                        "lat": 39.738453,
                                        "lng": -104.984853
                                    },
                                    "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ee7MHaAV8RNsgNFChrsszAE71lD8YA1X&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=1936097177"
                                },
                                {
                                    "street": "",
                                    "adminArea6": "",
                                    "adminArea6Type": "Neighborhood",
                                    "adminArea5": "",
                                    "adminArea5Type": "City",
                                    "adminArea4": "Denver County",
                                    "adminArea4Type": "County",
                                    "adminArea3": "CO",
                                    "adminArea3Type": "State",
                                    "adminArea1": "US",
                                    "adminArea1Type": "Country",
                                    "postalCode": "",
                                    "geocodeQualityCode": "A4XAX",
                                    "geocodeQuality": "COUNTY",
                                    "dragPoint": false,
                                    "sideOfStreet": "N",
                                    "linkId": "282932003",
                                    "unknownInput": "",
                                    "type": "s",
                                    "latLng": {
                                        "lat": 39.738453,
                                        "lng": -104.984853
                                    },
                                    "displayLatLng": {
                                        "lat": 39.738453,
                                        "lng": -104.984853
                                    },
                                    "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ee7MHaAV8RNsgNFChrsszAE71lD8YA1X&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-2&scalebar=true&zoom=9&rand=-281837090"
                                }
                            ]
                        }
                    ]
                }
    
            coordinates = Coordinates.new(data)
            results = OpenweatherFacade.get_booksearch_weather(coordinates)
            
            expect(results).to be_a Booksearchweather
            expect(results.summary).to be_a String
            expect(results.temperature).to be_a String 
        end 
    end 
end 