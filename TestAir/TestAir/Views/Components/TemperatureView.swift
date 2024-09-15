//
//  TemperatureView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import SwiftUI

/// Displays the current temperature - large digit in the centre
struct TemperatureView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    var body: some View {
       VStack {
            if let weatherResponse = viewModel.weatherResponse{
                Text("\(weatherResponse.main.temp, specifier: "%.0f") °")
            }
       
        }
        .padding()
        .font(.system(size: 50))
        
    }
}
