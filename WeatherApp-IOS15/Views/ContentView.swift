//
//  ContentView.swift
//  WeatherApp-IOS15
//
//  Created by Daniel Garofalo on 1/23/22.
//

import SwiftUI

struct ContentView: View {

    //MARK: - PROPERTIES
    
    //Instance of LocationManager
    //@StateObject will notify the view every time the location is updated
    @StateObject var locationManager = LocationManager()
    //Instance of WeatherManager(response needs to be optional, since we might not get one)
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    //MARK: - BODY
    //MARK: VIEW
    var body: some View {
        
        VStack{
            
            //We need a conditional since the location is an optional: we could get it or not
            //if we are able to get a location
            if let location = locationManager.location {
                
                //Location gathering test
                //Text("Your Coordinates are : \(location.longitude), \(location.latitude)")
                
                //If there is already some weather data
                if let weather = weather {
                    Text("Weather data fetched!")
                } else {
                    //Try to load the data from loading view
                    LoadingView()
                         //.task modifier adds an async task to perform
                        .task {
                            do{
                                //Pass lat/long to the weather manager
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{
                                print("Error getting data : \(error)")
                            }
                        }
                }
                
                
            } else {
                //if we are not able to get a location
                //and if it is loading
                if locationManager.isLoading {
                    //show spinner
                    LoadingView()
                } else {
                    //Call WelcomeView
                    WelcomeView()
                        .environmentObject(locationManager) //...and getting location right away
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    
    
    }//: VIEW
}//: BODY


    //MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.portrait)
    }
}
