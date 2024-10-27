//
//  ContentView.swift
//  Weather-App-SwiftUI
//
//  Created by Muhammad Shayan on 26/10/2024.
//

import SwiftUI

/* SwiftUI is declarative. UIKit is imperative.
 In imperative programming, you tell UI to update based on logic.
 In declarative programming, we give UI the rules to update upfront.
 UI knows ahead of time the states it can be in.
 */

/*
 SwiftUI View Trees:
 In SwiftUI views are structs, lightweight and performant.
 Views conform to the protocol View.
 Base view is the root of the view tree.
 SwiftUI is efficient (tree diffing algo), because it knows all the
 possibilities view tree can take. So, when the data is updated,
 SwiftUI quickly updates the UI.
 */

/*
 @ViewBuilders:
 All the elements that return a view are view builders.
 @ViewBuilder is the closure which returns Content which
 conforms to View. We can conditionally show views.
 */

/*
 Modifiers:
 Everytime you add a modifier to a view, you are
 wrapping the view with a new view (modifier), and therefore
 order of the modifier matters. For example, adding a frame
 to the view. If we add a modifier to a parent or container view,
 it will apply to the contained views too (if the modifiers
 applies to both container and contained views).
 */

struct ContentView: View {
    // In SwiftUI, we don't update the UI directly.
    // We use some source of truth data to update the UI.
    // Struct is created and destroyed all the time.
    // But @State keeps the data intact.
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight) // @Binding variable
            VStack(spacing: 8) {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill":  "cloud.sun.fill",
                                      temperature: 76)
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                Spacer() // Spacing fill the entire space.
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .mint)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    // Binding is used when we are changing the value in the view.
    var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape().fill(isNight ? Color.black.gradient: Color.blue.gradient) // everything in SwiftUI is a view.
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default)) // Every modifier is also a view,
            .foregroundColor(.white)                                    // wrapping view on which it is applied.
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.gray, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


