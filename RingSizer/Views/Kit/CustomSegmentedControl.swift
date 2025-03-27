//
//  CustomSegmentedControl.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 20/03/2025.
//
import SwiftUI

enum MeasurementWays: String, CaseIterable {
    case ByRing = "By Ring"
    case ByFinger = "By Finger"
}

struct CustomSegmentedControl: View {
    @Binding var selectedItem: MeasurementWays
    
    
    var body: some View {
        HStack {
            ForEach(MeasurementWays.allCases, id: \.rawValue) { MeasurementWay in
                Text(MeasurementWay.rawValue)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(10)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(selectedItem == MeasurementWay ? Color.primary : Color.secondary)
                        }
                        .animation(.bouncy, value: selectedItem)
                    }
                    .onTapGesture {
                        selectedItem = MeasurementWay
                    }
            }
        }
        .padding(5)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.secondary, lineWidth: 1)
        }
    }
}
