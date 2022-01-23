//
//  LocationManager.swift
//  WeatherApp-IOS15
//
//  Created by Daniel Garofalo on 1/23/22.
//

import Foundation
import CoreLocation

/**
 Will help us pull all the information from the location
 */
class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    //MARK: - PROPERTIES
    
    //manager location
    let manager = CLLocationManager()
    
    //Optional location. Might not get a location (
    @Published var location : CLLocationCoordinate2D?
    //Loading State
    @Published var isLoading = false
    
    
    //MARK: - CUSTOM METHODS
    
    //init of class
    override init() {
        super.init()
        
        manager.delegate = self
    }
    
    //request location
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //save the coordinates into the location and toggle the isLoading flag
        location = locations.first?.coordinate
        isLoading = false
    }
    
    //Exception handler
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Error getting location: ", error)
        isLoading = false
    }
    
}
