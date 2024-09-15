//
//  DateUtils.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import Foundation


/// Utility methods for date conversions
struct DateUtils {
    
    /// Converts a Unix timestamp to a formatted date string
    ///  - Parameter dt: Unix timestamp as an integer
    ///  - Returns: Formatted date string with abbreviated weekday and two-char day
    static func convertWeatherTimeFromDt(dt: Int) -> String {
        let unixTimestamp: TimeInterval = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: unixTimestamp)
        let formatedDate = date.formatted(.dateTime.weekday(.abbreviated).day(.twoDigits))
        
        return formatedDate
    }
}
