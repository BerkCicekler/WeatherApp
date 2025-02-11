//
//  Home.swift
//  Weather
//
//  Created by Berk Çiçekler on 11.02.2025.
//

import SwiftUI

struct HomeView: View {
    let gradient = Gradient(colors: [Color("Background1"), Color("Background2")])
    @State var show = false
    var body: some View {
        ZStack {
            Image(.homeBackground)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Image(.homeHouse)
                .resizable()
                .frame(width: 350, height: 350)
            HStack {
                Text("asd")
                Button("asd")  {
                    show.toggle()
                }
            }
        }.sheet(isPresented: $show) {
            HStack {
                
            }.presentationBackground(.blue)
        }
.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HomeView()
}
