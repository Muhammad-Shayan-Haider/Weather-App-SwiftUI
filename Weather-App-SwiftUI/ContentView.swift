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
            VStack(spacing: 8) {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default)) // Every modifier is also a view,
                    .foregroundColor(.white)                                    // wrapping view on which it is applied.
                    .padding()
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer() // Spacing fill the entire space.
            }
        }
    }
}

#Preview {
    ContentView()
}
