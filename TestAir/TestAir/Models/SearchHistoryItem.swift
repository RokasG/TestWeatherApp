//
//  Untitled.swift
//  TestAir
//
//  Created by rocco on 23/09/2024.
//
import Foundation
import SwiftUI

/// Represents an item in the search history.
struct SearchHistoryItem: Identifiable, Codable {
    var id = UUID() // Unique identifier
    var iconUrl: URL? // Optional weather icon URL
    var searchdate: Date // Date of the search
    var temDate: Int // Timestamp from API
    var cityName: String // City name
    var temperature: Double // Temperature in the city
    var weatherDescription: String // Weather description
}
