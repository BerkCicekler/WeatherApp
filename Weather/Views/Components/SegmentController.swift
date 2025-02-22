//
//  SegmentController.swift
//  Weather
//
//  Created by Berk Çiçekler on 17.02.2025.
//

import SwiftUI

struct SegmentedController: View {
    @Binding var selection: Int
    var body: some View {
        VStack() {
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 0
                    }
                } label: {
                    Text("Hourly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 1
                    }
                } label: {
                    Text("Monthly Forecast")
                }.frame(minWidth: 0,  maxWidth: .infinity)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(.secondary)
            
            // MARK: Separator
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.1), radius: 0, x: 0, y: 1)
                .blendMode(.overlay)
                .overlay {
                    HStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underline)
                            .blendMode(.overlay)
                    }
                    .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
                    .offset(y: -1)
                }
            }
    }
}

#Preview {
    SegmentedController(
        selection: .constant(0)
    )
}
