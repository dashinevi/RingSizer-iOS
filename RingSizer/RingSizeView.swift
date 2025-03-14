//
//  RingSizeView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 12/03/2025.
//
import SwiftUI
import UIKit

struct RingSizeView: View {
    let frameSize: CGFloat = 300
    @State private var diameter: CGFloat = 85
    let ppi: CGFloat = getDevicePPI()
    
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
func getDevicePPI() -> CGFloat {
    let scale = UIScreen.main.scale  // Get Retina scale (1x, 2x, 3x)
    
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        let screenSize = UIScreen.main.nativeBounds.size
        let screenHeight = max(screenSize.width, screenSize.height)

        let ppi: CGFloat
        switch screenHeight {
        case 2778, 2796: ppi = 458 // iPhone 14/15 Pro Max
        case 2532, 2556: ppi = 460 // iPhone 13/14/15 Pro
        case 2340: ppi = 476 // iPhone 13 Mini
        case 1792: ppi = 326 // iPhone XR
        default: ppi = 326 // Default (older devices)
        }
        
        return ppi / scale  // Convert to POINTS per inch

    default:
        return 326 / scale  // Default fallback
    }
}


#Preview {
    RingSizeView()
}
