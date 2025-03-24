//
//  GetSizeView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 14/03/2025.
//
import SwiftUI

struct GetSizeView: View {
    @State private var measurementWay: MeasurementWays = .ByRing
    
    var body: some View {
        VStack {
            Text("Get your ring size")
                .font(.title)
                .fontWeight(.semibold)
            CustomSegmentedControl(selectedItem: $measurementWay)
            
            if measurementWay == .ByRing {
                RingSizeView()
            } else {
                FingerSizeView()
            }
        }
    }
}

#Preview {
    GetSizeView()
}
