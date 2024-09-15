//
//  SearchHistoryManager.swift
//  TestAir
//
//  Created by rocco on 15/09/2024.
//


import Foundation

/// Manages the search history by saving and loading from UserDefaults.
class SearchHistoryManager {
    private let defaults = UserDefaults.standard
    private let historyKey = "searchHistory"
    
    /// Saves a new search item to UserDefaults
    /// - Parameter item: The search item to be saved
    func saveSearch(item: SearchHistoryItem) {
        var history: [SearchHistoryItem] = {

            // Load existing history or start with an empty array
            if let data = defaults.data(forKey: historyKey) {
                return (try? JSONDecoder().decode([SearchHistoryItem].self, from: data)) ?? []
            }
            return []
        }()
        
        history.append(item)
        
        // Keep only the last 5 searches
        if history.count > 5 {
            history.removeFirst(history.count - 5)
        }
        // Save the updated histor
        if let encoded = try? JSONEncoder().encode(history) {
            defaults.set(encoded, forKey: historyKey)
        }
    }
    
    /// Loads the existing search history from UserDefaults
    /// - Returns: An array of search history items.
    func loadExistingHistory() -> [SearchHistoryItem] {
        if let data = defaults.data(forKey: historyKey),
           let history = try? JSONDecoder().decode([SearchHistoryItem].self, from: data) {
            return history
        }
        return []
    }
}
