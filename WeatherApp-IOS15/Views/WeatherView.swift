//
//  WeatherView.swift
//  WeatherApp-IOS15
//
//  Created by Daniel Garofalo on 2/21/22.
//


import SwiftUI

/**
 # struct WeatherView: View
 If data is fetched, will display the weather from the coordinates in this view
*/
struct WeatherView: View {
    
    //MARK: - PROPERTIES
    var weather: ResponseBody
    
    //MARK: - BODY
    //MARK: VIEW
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }//:VIEW
}//:BODY

    //MARK: - PREVIEW
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: <#ResponseBody#>)
    }
}
