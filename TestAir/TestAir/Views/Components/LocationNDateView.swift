//
//  LocationNDateView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import SwiftUI

/// Displays the city name and the current date based on the weather response
struct LocationNDateView: View {
    
    @Binding var cityName: String
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    // City name
                    if let cityName = viewModel.weatherResponse?.name {
                        Text(cityName)
                        
                    }
                }
                .padding(.leading, 10)
                .padding(.top, 20)
                
                Spacer()
                
                VStack {
                    // Date
                    if let dt = viewModel.weatherResponse?.dt {
                        let formattedDate = DateUtils.convertWeatherTimeFromDt(dt: dt)
                        let dateComponents = formattedDate.split(separator: " ")
                        
                        if dateComponents.count == 2 {
                            Text(String(dateComponents[0]).uppercased())
                            Text(String(dateComponents[1]))
                        } else {
                            Text(formattedDate)
                        }
                    }
                }
                .padding(.trailing, 5)
            }
        }
    }
}

