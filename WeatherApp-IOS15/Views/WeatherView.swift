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
        //ZSTack
        ZStack(alignment: .leading){
            
            //Full container
            VStack{
                //Top Stack: City and Date
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today: \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }//:VStack
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                //Mid Stack: City/main temp and main indicator
                VStack {
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 80))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    //City image
                    AsyncImage(url:URL(string:"https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }//:VStack
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //Bottom Stack -  Weather now (weather details)
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Now:")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }//:VStack
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
        
        
        
    }//:VIEW
}//:BODY

    //MARK: - PREVIEW
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
