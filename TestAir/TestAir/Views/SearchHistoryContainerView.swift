//
//  SearchHistoryView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//
import SwiftUI


/// Shows a list of past weather searches with details including weather icon, description, temperature, city name, and date
/// Violates the DRY, needs refactoring
struct SearchHistoryContainerView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        List(viewModel.getSearchHistory().reversed(), id: \.id) { item in
            VStack {
                HStack {
                    // Icon
                    if let iconUrl = item.iconUrl {
                        AsyncImage(url: iconUrl) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 50, height: 50)
                            
                        }
                    } else {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    
                    // Weather Description
                    Text(item.weatherDescription.capitalized)
                    
                    Spacer()
                }
                .padding(.trailing, 50)
                
                // Temperature
                Text("\(item.temperature, specifier: "%.0f")°C")
                    .font(.system(size: 50))
                    .padding()
                
                // City Name and Date
                HStack {
                    Text(item.cityName)
                    
                    Spacer()
                    
                    let formattedDate = DateUtils.convertWeatherTimeFromDt(dt: item.temDate)
                    let dateComponents = formattedDate.split(separator: " ")
                    VStack(alignment: .trailing) {
                        Text(String(dateComponents[0]).uppercased())
                        Text(String(dateComponents[1]))
                    }
                }
                .padding()
            }
            .border(Color.gray, width: 0.5)
            .padding(.horizontal)
        }
    }
}
