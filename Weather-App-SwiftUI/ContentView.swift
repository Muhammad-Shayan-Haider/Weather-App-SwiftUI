//
//  ContentView.swift
//  Weather-App-SwiftUI
//
//  Created by Muhammad Shayan on 26/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), // everything in SwiftUI is a view.
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default)) // Every modifier is also a view,
                    .foregroundColor(.white)                                    // wrapping view on which it is applied.
                    .padding()
                Spacer() // Spacing fill the entire space.
                                
            }
        }
    }
}

#Preview {
    ContentView()
}
