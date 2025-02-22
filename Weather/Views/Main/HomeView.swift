//
//  Home.swift
//  Weather
//
//  Created by Berk Çiçekler on 11.02.2025.
//

import SwiftUI
import BottomSheet

enum BottomSheetPositions: CaseIterable {
    case medium
    case top
    
    var detent: BottomSheet.PresentationDetent {
        switch self {
        case .medium:
            return .fraction(0.43)
        case .top:
            return .fraction(0.85)
        }
    }
}

struct HomeView: View {
    

    @State var selectedDetent: BottomSheet.PresentationDetent = BottomSheetPositions.medium.detent
    @State var bottomSheetTranslation: CGFloat = BottomSheetPositions.medium.detent.size
    @State var hasDraggetTop: Bool = false
    
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPositions.medium.detent.size) / (BottomSheetPositions.top.detent.size - BottomSheetPositions.medium.detent.size)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                
                ZStack {
                    // MARK: Background Color
                    Color.background.ignoresSafeArea()
                    
                    // MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -(bottomSheetTranslationProrated * screenHeight))
                    
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
                        Text("Montreal")
                            .font(.largeTitle)
                        VStack {
                            Text(attributedString)
                            
                            Text("H:24° L:18°")
                                .font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }
                        Spacer()
                    }.padding(.top, 51)
                        .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    EmptyView()
                        .sheetPlus(
                            isPresented: .constant(true),
                            background: EmptyView(),
                            onDrag: { height in
                                bottomSheetTranslation = height
                                withAnimation(.easeInOut) {
                                    hasDraggetTop = BottomSheetPositions.top.detent.size < height + 20
                                }
                            },
                            main: {
                                ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                                    .presentationDetentsPlus([BottomSheetPositions.medium.detent,BottomSheetPositions.top.detent], selection: $selectedDetent
                                    )
                            }
                        )
                    
                    TabBar(action: {})
                        .offset(y: bottomSheetTranslationProrated < 0 ? 0 : bottomSheetTranslationProrated * 115)
                    
                    
                }
                .toolbar(.hidden)
            }
        }
        }
    
    
    private var attributedString: AttributedString {
        var string = AttributedString("19°" + (hasDraggetTop ? " | " :"\n ") + "Mostly Clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated *  (96 - 20))), weight: hasDraggetTop ? .semibold : .thin)
            string[temp].foregroundColor = hasDraggetTop ? .secondary : .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
                .opacity(bottomSheetTranslationProrated )
        }
        
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

#Preview {
    HomeView()
}
