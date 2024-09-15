//
//  LogoView.swift
//  TestAir
//
//  Created by rocco on 14/09/2024.
//

import SwiftUI

/// Displays the application logo
struct LogoView: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .padding(30)
                .background(
                    Color(red: 139 / 255.0, green: 139 / 255.0, blue: 139 / 255.0)
                )
                .cornerRadius(8)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    LogoView()
}
