//
//  TabBarView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 11/03/2025.
//
import SwiftUI
import TabBar

enum Item: Int, Tabbable {
    case converter
    case size
    case saved
    
    var icon: String {
        switch self {
        case .converter: return "arrow.left.arrow.right.circle"
        case .size: return "arrow.up.left.and.arrow.down.right.circle"
        case .saved: return "heart.circle"
        }
    }
    
    var title: String {
        switch self {
        case .converter: return "Converter"
        case .size: return "Size"
        case .saved: return "Saved"
        }
    }
}

struct CustomTabBarStyle: TabBarStyle {
    func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        HStack {
            itemsContainer()
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background(
                    Capsule()
                        .fill(.black)
                )
                .padding()
        }
    }
}

struct CustomTabItemStyle: TabItemStyle {
    func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        HStack {
            Text(title)
                .fontWeight(.regular)
            Image(systemName: icon)
        }
        .foregroundColor(isSelected == true ? .white : .gray)
    }
}
