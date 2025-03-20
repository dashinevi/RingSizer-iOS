//
//  ContentView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: Tab = .size
    
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                switch activeTab {
                case .size:
                    GetSizeView()
                case .converter:
                    ConverterView()
                case .saved:
                    RingSizeView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    TabBarView(selectedTab: $activeTab)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
