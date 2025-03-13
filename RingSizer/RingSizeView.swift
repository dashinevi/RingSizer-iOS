//
//  RingSizeView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 12/03/2025.
//
import SwiftUI

struct RingSizeView: View {
    let frameSize: CGFloat = 300
    @State private var diameter: CGFloat = 85
    let ppi: CGFloat = 160 // change based on screen
    
    var diameterInMM: CGFloat {
        let inches = diameter / ppi
        return inches * 25.4
    }
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: diameter, height: diameter)
                .foregroundColor(.black)
                
        }
        .frame(width: frameSize, height: frameSize)
        .border(Color.black, width: 1)
        VStack {
            Slider(value: $diameter, in: 60...180, step: 0.1)
                .padding()
            Text("Diameter: \(diameterInMM, specifier: "%.2f") mm")
                .padding()
        }
    }
}

#Preview {
    RingSizeView()
}
