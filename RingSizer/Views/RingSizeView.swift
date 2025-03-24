//
//  RingSizeView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 12/03/2025.
//
import SwiftUI

struct RingSizeView: View {
    let frameSize: CGFloat = 300
    let ppi: CGFloat = getDevicePPI()
    
    let ringSizes: [RingSize] = RingSize.standardSizes
    
    @State private var selectedIndex: Int = 0
    
    var selectedRingSize: RingSize {
        ringSizes[selectedIndex]
    }
    
    var diameter: CGFloat {
        (selectedRingSize.diameterMM / 25.4) * ppi
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Put the ring on the circle")
                    .font(.title2)
                
                VStack {
                    Circle()
                        .stroke(.black, lineWidth: 1)
                        .frame(width: diameter, height: diameter)
                        .foregroundColor(.clear)
                    
                    Text("\(selectedRingSize.diameterMM, specifier: "%.2f") mm")
                }
                .frame(width: frameSize, height: frameSize)
                
                VStack {
                    Slider(
                        value: Binding(
                            get: { Double(selectedIndex) },
                            set: { newIndex in
                                selectedIndex = min(max(0, Int(newIndex)), ringSizes.count - 1)
                            }
                        ),
                        in: 0...Double(ringSizes.count - 1),
                        step: 1
                    )
                    .padding()
                }
                
                NavigationLink {
                    VStack(alignment: .leading) {
                        Text("USA/Canada: \(selectedRingSize.usSize)")
                        Text("United Kingdom: \(selectedRingSize.ukSize ?? "-")")
                        Text("France: \(selectedRingSize.euSize)")
                        Text("Japan: \(selectedRingSize.jpSize ?? "-")")
                    }
                } label: {
                    Text("Show Size")
                }
            }
        }
    }
}


#Preview {
    RingSizeView()
}
