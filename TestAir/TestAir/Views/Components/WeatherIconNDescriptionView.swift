//
//  WeatherIconView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import SwiftUI


/// Displays the weather icon and description fetched from the view model.
struct WeatherIconNDescriptionView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                // Weather Icon
                if let iconUrl = viewModel.weatherIconUrl {
                    AsyncImage(url: iconUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                // Weather Description
                if let weatherDescription = viewModel.weatherResponse?.weather.first?.description {
                    Text(weatherDescription.capitalized)
                        .font(.headline) 
                }
                
                Spacer()
            }
            .padding(.trailing, 150)
        }
    }
}


