//
//  GetSizeView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 14/03/2025.
//
import SwiftUI

struct GetSizeView: View {
    var measurements = ["By Ring", "By Finger"]
    @State private var selectedMeasurement = "By Ring"
    
    var body: some View {
        VStack {
            Picker("Get your ring size", selection: $selectedMeasurement) {
                ForEach(measurements, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            if selectedMeasurement == "By Ring" {
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
