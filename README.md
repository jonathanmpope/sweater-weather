# Welcome to Sweater Weather
This is my final solo Mod 3 project at Turing. 

## The core goals of this project were to:

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Built with:
* Ruby 2.7.4
* Rails 5.2.8.1
* RSpec 3.11

## APIs used:

* [OpenWeather Docs](https://openweathermap.org/api/one-call-api) 
* [MapQuest Doc](https://developer.mapquest.com/documentation/geocoding-api/)

## Setup
* Ensure that you have the same versions of Ruby, Rails, & RSpec 
* Clone this repo, navigate to the root folder, open in your favorite code editor 
* Run `bundle install`
* Run `bundle exec figaro install`
* Open the file **./config/application.yml** and add the following lines into the file:
    * `map_key: insert api key here`
    * `open_key: insert api key here`
* Run `rails db:{drop,create,migrate}`
* Run `rails server`
* You should now be able to consume the API endpoints described below using Postman or a similar tool. Default host is http://localhost:3000

### To run the test suite:
* run `bundle exec rspec`

### To open a coverage report:
* run `open coverage/index.html`

## API Calls available
* Retrieve precise weather info for a specified location
* Register/create a user (also creates an API key that will be needed later)
* Authenticate a user and retrieve that user's API key
* Return a Json for a 'Road Trip' with origin, destination, time to destination, and weather for the anticipated arrival time at the destination

## Database Schema

Database Schema Image

# Endpoints
## Retrieve Precise Weather Info
* `GET /api/v1/forecast`
* Required Params:
    * location
    * This can be in an address format or city/state, e.g. 'denver,co'
* Example Request
    * `GET http://localhost:3000/api/v1/forecast?location=denver,co`
    * Content-Type: application/json
    * Accept: application/json
### Example Response
* Returns 5 days and 8 hours of weather data

```json 
{
    "data": {
        "id": null,
        "type": "weather",
        "attributes": {
            "current_weather": {
                "datetime": "2022-09-26T13:36:20.000-06:00",
                "sunrise": "2022-09-26T06:51:19.000-06:00",
                "sunset": "2022-09-26T18:51:06.000-06:00",
                "temperature": 79.23,
                "feels_like": 79.23,
                "humidity": 23,
                "uvi": 5.95,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01d"
            },
            "hourly_weather": [
                {
                    "time": "01:00:00 PM",
                    "temperature": 79.18,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "02:00:00 PM",
                    "temperature": 79.23,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "03:00:00 PM",
                    "temperature": 79.7,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "04:00:00 PM",
                    "temperature": 80.24,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "05:00:00 PM",
                    "temperature": 80.44,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "06:00:00 PM",
                    "temperature": 79.7,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "07:00:00 PM",
                    "temperature": 76.59,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "08:00:00 PM",
                    "temperature": 74.41,
                    "conditions": "clear sky",
                    "icon": "01n"
                }
            ],
            "daily_weather": [
                {
                    "date": "09/26/2022",
                    "sunrise": "2022-09-26T06:51:19.000-06:00",
                    "sunset": "2022-09-26T18:51:06.000-06:00",
                    "max_temp": 80.44,
                    "min_temp": 59.5,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "09/27/2022",
                    "sunrise": "2022-09-27T06:52:16.000-06:00",
                    "sunset": "2022-09-27T18:49:27.000-06:00",
                    "max_temp": 78.93,
                    "min_temp": 61.65,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "09/28/2022",
                    "sunrise": "2022-09-28T06:53:13.000-06:00",
                    "sunset": "2022-09-28T18:47:48.000-06:00",
                    "max_temp": 83.8,
                    "min_temp": 59.99,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "09/29/2022",
                    "sunrise": "2022-09-29T06:54:09.000-06:00",
                    "sunset": "2022-09-29T18:46:10.000-06:00",
                    "max_temp": 83.01,
                    "min_temp": 64.47,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "09/30/2022",
                    "sunrise": "2022-09-30T06:55:07.000-06:00",
                    "sunset": "2022-09-30T18:44:32.000-06:00",
                    "max_temp": 80.91,
                    "min_temp": 58.87,
                    "conditions": "light rain",
                    "icon": "10d"
                }
            ]
        }
    }
}
```

## Register a User
* `POST /api/v1/users`
* Required Params:
    * email
    * password
    * password_confirmation - must match password 
* Example Request
    * `POST http://localhost:3000/api/v1/users`
    * Content-Type: application/json
    * Accept: application/json
    * Body: 
    ```json 
            {
        "email": "whatever123@example.com",
        "password": "password",
        "password_confirmation": "password"
        }
    ```
* Important: email, password, and password-confirmation must be passed as a JSON payload in the body and not as params in the URL 
### Example Response
* Returns the API necessary for the Roadtrip API endpoint described below 

```json 
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "email": "whatever123@example.com",
            "api_key": "afd4b8a96027861c3b6929ef77c2794b"
        }
    }
}
```

## Login a User
* `POST /api/v1/sessions`
* Required Params:
    * email
    * password
* Example Request
    * `POST http://localhost:3000/api/v1/sessions`
    * Content-Type: application/json
    * Accept: application/json
    * Body: 
    ```json 
            {
        "email": "whatever123@example.com",
        "password": "password",
        }
    ```
* Important: data must be passed as a JSON payload in the body and not as params in the URL 
### Example Response
* Returns the API key and email

```json 
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "email": "whatever123@example.com",
            "api_key": "afd4b8a96027861c3b6929ef77c2794b"
        }
    }
}
```

## Roadtrip 
* `POST /api/v1/road_trip`
* Required Params:
    * origin
    * destination
    * api_key - must match a users api key 
* Example Request
    * `POST http://localhost:3000/api/v1/road_trip`
    * Content-Type: application/json
    * Accept: application/json
    * Body: 
    ```json 
            {
        "origin": "Denver,CO",
        "destination": "Fruita,CO",
        "api_key": "afd4b8a96027861c3b6929ef77c2794b"
        }
    ```
* Important: data must be passed as a JSON payload in the body and not as params in the URL 
### Example Response
* Returns the travel time and weather when you'll arrive at your location
```json 
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Fruita,CO",
            "travel_time": "0 days, 3 hours, 37 minutes",
            "weather_at_eta": {
                "temperature": 81.25,
                "conditions": "clear sky"
            }
        }
    }
}
```
