//
//  WelcomeView.swift
//  WeatherApp-IOS15
//
//  Created by Daniel Garofalo on 1/23/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    //MARK: - PROPERTIES
    @EnvironmentObject var locationManager : LocationManager
    
    //MARK: - BODY
    //MARK: VIEW
    var body: some View {
        
        
        VStack{
            VStack (spacing: 20){
                
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                
                
                Text("Please, share your current location to get weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            //From CoreLocationUI
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        

        
    }//:VIEW
}//:BODY

    //MARK: - PROPERTIES
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
