//
//  ForecastView.swift
//  Weather
//
//  Created by Berk Çiçekler on 13.02.2025.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    
    var body: some View {

            VStack {
                SegmentedController(selection: $selection)
                    .padding(.top, 20)
                    
                // MARK: Forecast Cards
                ScrollView(.horizontal) {
                    HStack {
                        if selection == 0 {
                            ForEach(Forecast.hourly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            ForEach(Forecast.weekly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .daily)
                                
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical, 5)
                   
                }
                .padding(.horizontal, 20)
                .scrollIndicators(.never)
                
                // MARK: Forecast Cards
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
            }
        
        .background(Color.bottomSheetBackground)
        .backgroundBlur(radius: 25, opaque: true)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
        .overlay {
            // MARK: Bottom Sheet Seperator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    ForecastView()
}
