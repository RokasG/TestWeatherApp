//
//  TestAirConfig.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//


///  Base values for the API to use
struct TestAirConfig {
    static let apiKey = ""
    static let apiBaseUrl = "https://api.openweathermap.org/data/2.5/weather"
    static let iconBaseUrl = "https://openweathermap.org/img/wn/"
    static let iconExtensioUrl = "@2x.png"
    static let measureUnit = "metric"
    
}

// MARK: - Notes
//Weather icon API endpoint: https://openweathermap.org/img/wn/{icon_name}@2x.png
//Parameters you'll need from the API: weather.description, weather.icon, main.temp, dt, name.
