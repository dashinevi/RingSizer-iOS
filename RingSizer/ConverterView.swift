//
//  ConverterView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 17/03/2025.
//
import SwiftUI

struct ConverterView: View {
    @State private var diameter: CGFloat = 16.5 // Default starting value

    
    let ringSizes: [(diameter: CGFloat, us: String, eu: String, uk: String, jp: String)] = [
        (14.88, "4", "47", "H", "7"),
        (15.70, "5", "49", "J", "9"),
        (16.51, "6", "51", "L", "11"),
        (17.35, "7", "54", "N", "14"),
        (18.19, "8", "57", "P", "16"),
        (19.10, "9", "59", "R", "18"),
        (19.84, "10", "62", "T", "20"),
        (20.68, "11", "64", "V", "23"),
        (21.49, "12", "67", "X", "25"),
        (22.33, "13", "70", "Z", "27")
    ]
    
    var closestSize: (String, String, String, String) {
        let closest = ringSizes.min(by: { abs($0.diameter - diameter) < abs($1.diameter - diameter) })!
        return (closest.us, closest.eu, closest.uk, closest.jp)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Select Ring Diameter (mm):")
                .font(.headline)
            
            Text("\(diameter, specifier: "%.2f") mm")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Slider(value: $diameter, in: 14.88...22.33, step: 0.01)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("🇺🇸 US/CA: \(closestSize.0)")
                Text("🇪🇺 EU/ISO: \(closestSize.1)")
                Text("🇦🇺🇬🇧 AU/GB: \(closestSize.2)")
                Text("🇯🇵🇨🇳 JP/CN: \(closestSize.3)")
            }
            .font(.title2)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ConverterView()
}
