//
//  ContentContainerView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import SwiftUI


/// Main view container displaying the logo and search components
/// Wraps the LogoView and SearchComponentsView.
struct ContentContainerView: View {
    @Binding var cityName: String
    @EnvironmentObject var viewModel: WeatherViewModel 
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                   LogoView()
                   SearchComponentsView(cityName: $cityName)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, geometry.size.width > geometry.size.height ? 100 : 200)
            }
        }
    }
}

