//
//  WeatherRow.swift
//  WeatherApp-IOS15
//
//  Created by Daniel Garofalo on 2/21/22.
//

import Foundation
import SwiftUI

/**
 #WeatherRow
 This one handles the display of the weather for a city in a row
*/
struct WeatherRow: View {
    
    //MARK: - PROPERTIES
    var logo: String
    var name: String
    var value: String

    //MARK: - VIEW
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)

            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)

                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

    //MARK: - PREVIEW
struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
