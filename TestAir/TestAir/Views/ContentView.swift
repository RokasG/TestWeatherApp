//
//  ContentView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cityName: String = ""
    @ObservedObject var viewModel = WeatherViewModel()
 
    var body: some View {
        VStack {
            ContentContainerView(cityName: $cityName ).environmentObject(viewModel)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
