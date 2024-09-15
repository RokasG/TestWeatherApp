//
//  SearchResultView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import SwiftUI


/// Displays the search results and handles the fetching state for weather data
/// Shows a loading indicator, error messages, or the weather data based on the current state
/// Triggers a fetch operation when the view appears if the city name is not empty
/// Clears the city name input afrer fetchign
struct SearchResultContainerView: View {
    @Binding var cityName: String
    @EnvironmentObject var viewModel: WeatherViewModel
    @State private var isFetching: Bool = false
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else if viewModel.weatherResponse == nil && isFetching {
                ProgressView()
                    .padding()
            } else if viewModel.weatherResponse != nil {
                WeatherIconNDescriptionView()
                TemperatureView()
                LocationNDateView(cityName: $cityName)
            }
        }
        .padding()
        .border(Color.gray, width: 0.5)
        .onAppear {
            if !cityName.isEmpty {
                isFetching = true // Start fetching state
                Task {
                    await viewModel.fetchWeather(cityName: cityName)
                    isFetching = false // Stop fetching after task completes
                    cityName = "" // Clear input only after the completed fetch
                }
            } 
//            else {
//                viewModel.errorMessage = "Please enter a city name."
//            }
        }
    }
}







// MARK: - Notes
// https://swdevnotes.com/swift/2022/display-loading-screen-when-fetching-data-in-swift/
