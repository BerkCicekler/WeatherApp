//
//  WeatherView.swift
//  Weather
//
//  Created by Berk Çiçekler on 22.02.2025.
//

import SwiftUI

struct WeatherView: View {
    @State var text: String = ""
    
    var searchResults: [Forecast] {
        if text.isEmpty {
            return Forecast.cities
        }else {
            return Forecast.cities.filter { forecast in
                return forecast.location.lowercased().contains(text.lowercased())
            }
        }
    }
    
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }.scrollIndicators(.hidden)
                .safeAreaInset(edge: .top) {
                    EmptyView().frame(height: 110)
                }
        }
        .overlay {
            NavigationBar(searchText: $text)
        }
        .toolbar(.hidden)
    }
}

#Preview {
    WeatherView()
}
