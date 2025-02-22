//
//  WeatherWidget.swift
//  Weather
//
//  Created by Berk Çiçekler on 22.02.2025.
//

import SwiftUI

struct WeatherWidget: View {
    var forecast: Forecast
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Trappezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    // MARK: Forecast Temprature
                    Text("\(forecast.temperature)°")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        // MARK: Forecast Temprature Range
                        Text("H:\(forecast.high)°  L: \(forecast.low)°")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        
                        // MARK: Forecast Location
                        Text(forecast.location)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    // MARK: Forecast Large Icon
                    Image("\(forecast.icon) large")
                        .padding(.trailing, 4)
                    
                    // MARK: Weather
                    Text(forecast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing, 24)
                }
            }
            .foregroundStyle(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        }
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

#Preview {
    WeatherWidget(
        forecast: Forecast.cities[0]
    )
}
