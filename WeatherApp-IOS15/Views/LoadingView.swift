//
//  LoadingView.swift
//  WeatherApp-IOS15
//
//  Created by Daniel Garofalo on 1/23/22.
//

import SwiftUI

/**
 Progress spinner with custom properties
 */
struct LoadingView: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - PROPERTIES
    //MARK: VIEW
    var body: some View {
        
        //comes with the api
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        
        
        
    }//:VIEW
}//:BODY

    //MARK: - PROPERTIES
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
