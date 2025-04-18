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
        ZStack {
            Color.myMainFirst
                .ignoresSafeArea()
            Image(.ringsForConverter)
                .resizable()
                .opacity(0.2)
            VStack {
                HStack {
                    Text("Get your ring size")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                CustomSegmentedControl(selectedItem: $measurementWay)
                    
                if measurementWay == .ByRing {
                    Text("Place your ring on the circle and adjust to match")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    RingSizeView()
                        .padding()
                } else {
                    Text("Place your finger on the screen and adjust to match")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    FingerSizeView()
                        .padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    GetSizeView()
}
