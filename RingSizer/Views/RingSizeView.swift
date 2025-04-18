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
        VStack {
            
            ringView
            
            Button(action: {
                showSize()
            }) {
                Text("Show the ring size")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.accentColor)
                    )
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.ultraThinMaterial)
        )
        .sheet(isPresented: $showSizeInfo) {
            sizeChartView
        }
    }
}

// MARK: file private methods

private extension RingSizeView {
    var ringView: some View {
        VStack {
            VStack {
                Circle()
                    .stroke(.accent, lineWidth: 2)
                    .background(Circle().foregroundColor(Color.accent.opacity(0.2)))
                    .frame(width: diameter, height: diameter)
                Text("\(selectedRingSize.diameterMM, specifier: "%.2f") mm")
            }
            .frame(width: frameSize, height: frameSize)
            HStack {
                Button(action: {
                        if selectedIndex > 0 {
                            selectedIndex -= 1
                        }
                }) {
                    Image(systemName: "minus.circle.fill")
                    .font(.largeTitle)
                }
                .padding(.horizontal)

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
                Button(action: {
                        if selectedIndex < ringSizes.count - 1 {
                            selectedIndex += 1
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    .padding(.horizontal)
            }
            .padding()
        }
    }
    
    var sizeChartView: some View {
        HStack {
            ZStack{
                Image(.ringForSizes)
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
}

// helpers
private extension RingSizeView {
    func showSize() {
        showSizeInfo = true
    }
}


#Preview {
    RingSizeView()
}
