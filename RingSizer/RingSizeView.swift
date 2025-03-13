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
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        let screenSize = UIScreen.main.nativeBounds.size
        let screenHeight = max(screenSize.width, screenSize.height)
        
        switch screenHeight {
        case 2778, 2796: return 458 // iPhone 14/15 Pro Max
        case 2532, 2556: return 460 // iPhone 13/14/15 Pro
        case 2340: return 476 // iPhone 13 Mini
        case 1792: return 326 // iPhone XR
        default: return 326 // Default (older devices)
        }
        
    default:
        return 326 // Default fallback
    }
}

#Preview {
    RingSizeView()
}
