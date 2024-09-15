//
//  WeatherResponse.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

struct WeatherApiResponse: Decodable {
    
    let weather: [Weather]
    let main: Main
    let dt: Int
    let name: String
    
    struct Weather: Decodable {
        let description: String
        let icon: String
    }
    
    struct Main: Decodable {
        let temp: Double
    }
}
