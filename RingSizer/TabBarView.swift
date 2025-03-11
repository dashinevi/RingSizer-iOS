//
//  TabBarView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 11/03/2025.
//
import SwiftUI

enum Tab: String, CaseIterable, Identifiable {
    case size
    case converter
    case saved
    
    var id: String {rawValue}
    
    var name: String {
        switch self {
        case .size: return "Size"
        case .converter: return "Converter"
        case .saved: return "Saved"
        }
    }
    
    var icon: String {
        switch self {
        case .size: return "arrow.up.left.and.arrow.down.right.circle"
        case .converter: return "arrow.left.arrow.right.circle"
        case .saved: return "heart.circle"
        }
    }
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
            
            HStack {
                Button(Tab.size.name, systemImage: Tab.size.icon) {
                    selectedTab = .size
                }
                .tint(selectedTab == .size ? .white : .gray)
                Spacer()
                Button(Tab.converter.name, systemImage: Tab.converter.icon) {
                    selectedTab = .converter
                }
                .tint(selectedTab == .converter ? .white : .gray)
                Spacer()
                Button(Tab.saved.name, systemImage: Tab.saved.icon) {
                    selectedTab = .saved
                }
                .tint(selectedTab == .saved ? .white : .gray)
            }
            .padding(.horizontal, 30)
        }
        .frame(width: .infinity, height: 60)
        .padding(10)
    }
}

#Preview {
    @Previewable @State var selectedTab: Tab = .size
    return TabBarView(selectedTab: $selectedTab)
}
