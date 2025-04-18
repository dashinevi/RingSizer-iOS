//
//  ContentView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 11/03/2025.
//

import SwiftUI
import TabBar

struct ContentView: View {
    @State private var selection: Item = .size
    @State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        NavigationStack {
            TabBar(selection: $selection, visibility: $visibility) {
                ConverterView()
                    .tabItem(for: Item.converter)
                GetSizeView()
                    .tabItem(for: Item.size)
                Text("saved")
                    .tabItem(for: Item.saved)
            }
            .tabBar(style: CustomTabBarStyle())
            .tabItem(style: CustomTabItemStyle())
        }
    }
}

#Preview {
    ContentView()
}
