//
//  SearchElementsView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//
import SwiftUI



/// Contains search input and navigation links for searching weather and viewing search history
struct SearchComponentsView: View {
    @Binding var cityName: String
    
    var body: some View {
 
            VStack {
                HStack {
                    // TextField for entering city name
                    TextField("Enter city name", text: $cityName)
                        .padding(12)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .frame(height: 44)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    // Button to navigate to weather results
                    NavigationLink(destination: SearchResultContainerView(cityName: $cityName)) {
                        Text("Go")
                            .padding()
                            .frame(width: 60, height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                // Button to navigate to search history
                NavigationLink(destination: SearchHistoryContainerView()) {
                    Text("History")
                        .padding()
                        .frame(width: 100, height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 20)
            }
    
    }
}
