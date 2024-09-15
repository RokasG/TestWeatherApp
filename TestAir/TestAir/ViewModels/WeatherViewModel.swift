//
//  WeatherViewModel.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//


import SwiftUI

/// Handles weather fetching, updating view properties, and managing search history.
class WeatherViewModel: ObservableObject {
    
    @Published var weatherResponse: WeatherApiResponse?
    @Published var weatherIconUrl: URL?
    @Published var errorMessage: String?
    
    
    private let testAirService = TestAirService()
    private let historyManager = SearchHistoryManager()
    
    /// Fetches weather data for the specified city and updates the view model's properties.
    /// - Parameter cityName: The name of the city to fetch weather data for.
    func fetchWeather(cityName: String) async{
        
        do {
            
            let (weatherResponse, iconUrl) = try await testAirService.fetchTempWithIcon(cityName: cityName)
            
            
            DispatchQueue.main.async{
                self.weatherResponse = weatherResponse
                self.weatherIconUrl = iconUrl
                
            }
            
            let searchHistoryItem = SearchHistoryItem(
                iconUrl: iconUrl,
                searchdate: Date(),
                temDate: weatherResponse.dt,
                cityName: weatherResponse.name,
                temperature: weatherResponse.main.temp,
                weatherDescription: weatherResponse.weather.first?.description ?? "No description")
            
            historyManager.saveSearch(item: searchHistoryItem)
         
            // Testing
            //printSearchHistory()
            //UserDefaults.standard.removeObject(forKey: "searchHistory")
            //print(iconUrl!)
            
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to fetch weather data. Please check if you have entered correct city name and try again."
                print("notfetching")
            }
        }
    }
    
    /// Retrieves the search history from the `SearchHistoryManager`.
    ///  - Returns: An array of `SearchHistoryItem` representing the search history.
    
    func getSearchHistory() -> [SearchHistoryItem] {
        return historyManager.loadExistingHistory()
    }
    
    // Helper methods
    func printSearchHistory() {
        print((UserDefaults.standard.data(forKey: "searchHistory").flatMap { try? JSONDecoder().decode([SearchHistoryItem].self, from: $0) }) ?? [])
    }
    
    func removeSearchHistory() {
        UserDefaults.standard.removeObject(forKey: "searchHistory")
        print("Search history cleared.")
    }
}




// MARK: - Notes

// https://developer.apple.com/documentation/foundation/userdefaults
