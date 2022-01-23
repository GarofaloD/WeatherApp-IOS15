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
    
    
    //MARK: - BODY
    //MARK: VIEW
    var body: some View {
        
        VStack{
            
            //We need a conditional since the location is an optional: we could get it or not
            if let location = locationManager.location {
                Text("Your Coordinates are : \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    //Calling WelcomeView
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
