//
//  WeatherManager.swift
//  WeatherApp-IOS15
//
//  Created by Daniel Garofalo on 2/21/22.
//

import Foundation
import CoreLocation

/**
 #WeatherManager
 This one will help us connect to the OpenWeatherApi. Manages the connection and response to/from OpenWeatherAPI
 */
class WeatherManager{
    
    //MARK: - CUSTOM FUNCTIONS
    
    /**
     # GetCurrentWeather
     Gets the weather based on the coordinates of the device and returs a response in 'ResponseBody' format
     */
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        
        //api key
        let key = "b35aa5377533aa45b3d7be651942825f"
        
        //Url definition
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)&units=imperial") else { fatalError("Missing URL")}
        //Url request definition
        let urlRequest = URLRequest(url: url)
        //make the url call using the url request
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        //Make sure the response is 200
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        //get the data from the response in the ResponseBody format
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}


    //MARK: - RESPONSE BODY STRUCT

    ///Response body struct: comes with coordinates, weather (which is an array of responses), main response, name, and wind response
struct ResponseBody: Decodable {
    
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    ///Coordinates Response: comes with longitude and latitude
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    ///Weather responses : id , main, description and icon
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    ///Main response: temp, feelsLike, tempMin tempMax, pressure and humidity
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }

    ///Wind response: speed and degrees
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

    
extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
