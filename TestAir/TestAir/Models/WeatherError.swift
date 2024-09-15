//
//  WeatherError.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import Foundation

/// Represents various errors that can occur while fetching or processing weather data
enum WeatherError: Error {
    case invalidUrl
    case invalidResponse
    case badStatusCode(Int)
    case networkError(URLError)
    case decodingError(DecodingError)
    case unknown(Error)
}
