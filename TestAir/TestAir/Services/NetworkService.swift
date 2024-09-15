//
//  NetworkService.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import Foundation


struct NetworkService {
      
    /// Performs an async http request, decodes the response.
    ///  - Parameter url: The URL to fetch data from
    ///  - Returns: A decoded response ( `T`)
    ///  - Throws: An error if the request fails or decoding fails
    func performRequest<T: Decodable>(url :URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw WeatherError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(T.self, from:data)
    }
    
}


// MARK: - Notes

// URLSession Cheatsheet
// https://github.com/alexpaul/UIKit/blob/main/URLSession-Cheatsheet.md

// SF - Swift generics and API calls
// https://stackoverflow.com/questions/65495133/swift-unable-to-create-generic-method-for-api-call
