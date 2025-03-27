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
    
    @State private var selectedIndex: Int = 15
    @State private var showSizeInfo = false
    
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
                Button("Show Size") {
                    showSize()
                }
                .padding()
                
                .sheet(isPresented: $showSizeInfo) {
                    sizeChartView()
                }
            }
        }
        
    }
    func showSize() {
        showSizeInfo = true
    }
}

// MARK: file private methods

private extension RingSizeView {
    private func sizeChartView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Diameter: \(selectedRingSize.diameterMM, specifier: "%.2f") mm")
                    .font(.title3)
                    .fontWeight(.semibold)
                VStack {
                    HStack {
                        Text("US:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(selectedRingSize.usSize ?? "-")")
                    }
                    HStack {
                        Text("UK:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(selectedRingSize.ukSize ?? "-")")
                    }
                    HStack {
                        Text("EU:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(selectedRingSize.euSize ?? "-")")
                    }
                    HStack {
                        Text("JP:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(selectedRingSize.jpSize ?? "-")")
                    }
                    HStack {
                        Text("IT:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(selectedRingSize.swissSize ?? "-")")
                    }
                    HStack {
                        Text("IN:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(selectedRingSize.inSize ?? "-")")
                    }
                }
                .padding()
                .background {
                    RoundedRectangle (cornerRadius: 20)
                        .stroke(Color.black)
                }
            }
            .padding(50)
        }
    }
}


#Preview {
    RingSizeView()
}
