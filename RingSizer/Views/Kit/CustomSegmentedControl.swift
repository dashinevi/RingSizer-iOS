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
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 35)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(selectedItem == MeasurementWay ? Color.accent : Color.accent.opacity(0.3))
                        }
                        .animation(.bouncy, value: selectedItem)
                    }
                    .onTapGesture {
                        selectedItem = MeasurementWay
                    }
            }
        }
    }
}

#Preview {
    CustomSegmentedControl(selectedItem: .constant(MeasurementWays.ByRing))
}
