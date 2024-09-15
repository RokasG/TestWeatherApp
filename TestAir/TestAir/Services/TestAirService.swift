//
//  TestAirService.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import Foundation


/// Service for fetching weather data and icon URL from the weather API
struct TestAirService {
    
    private let networkService = NetworkService()
    
    /// Fetches weather data and icon URL for a city
    /// - Parameter cityName: The city name
    /// - Returns: A tuple of weather data and optional icon URL.
    /// - Throws: Errors related to network requests or URL construction
    func fetchTempWithIcon (cityName: String) async throws -> (WeatherApiResponse, URL?){
        
        // Construct WeatherApiResponse
        let weatherApiUrl = try makeWeatherApiUrl(cityName: cityName)
        
        // Fetch and decode weather data
        let weatherApiResponse: WeatherApiResponse = try await networkService.performRequest(url: weatherApiUrl)
        
        /// Constructs the weather API URL
        /// - Parameter cityName: The city name
        /// - Returns: The API URL
        /// - Throws: Error if URL is invalid
        if let iconName = weatherApiResponse.weather.first?.icon {
            let iconUrlString = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
            let iconUrl = URL(string: iconUrlString)
            return (weatherApiResponse, iconUrl)
        } else {
            return (weatherApiResponse, nil)
        }
    }
    
    /// Constructs the URL for the weather API request.
    /// - Parameter cityName
    /// - Throws: `WeatherError.invalidUrl` if the URL cannot be constructed
    /// - Returns: A URL for the weather API endpoint with the specified city name and query parameters
    private func makeWeatherApiUrl(cityName: String) throws -> URL {
        var endpointComponents = URLComponents(string: TestAirConfig.apiBaseUrl)!
        endpointComponents.queryItems = [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "appid", value: TestAirConfig.apiKey),
            URLQueryItem(name: "units", value: TestAirConfig.measureUnit)
            
        ]
        
        guard let weatherApiurl = endpointComponents.url else {
            throw WeatherError.invalidUrl
        }
        return weatherApiurl
    }
}
