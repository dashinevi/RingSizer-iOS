//
//  DevicePPI.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 24/03/2025.
//
import SwiftUI
import UIKit

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
