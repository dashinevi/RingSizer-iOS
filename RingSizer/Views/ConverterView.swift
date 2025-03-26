//
//  ConverterView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 17/03/2025.
//
import SwiftUI

struct ConverterView: View {
    @State private var selectedCountry: Country = .usa
    @State private var selectedRingSize: RingSize?
    @State private var convertedSizes: [RingSize] = []
    
    let countries = Country.allCases
    let ringSizes = RingSize.standardSizes
    
    var body: some View {
        VStack {
            Picker("Select Country", selection: $selectedCountry) {
                ForEach(countries, id: \.self) { country in
                    Text(country.rawValue).tag(country)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            let measurementSystem = MeasurementSystem(country: selectedCountry)
            let filteredSizes = ringSizes.filter { size in
                isValidSize(for: size, measurementSystem: measurementSystem)
            }
            
            Picker("Select Ring Size", selection: $selectedRingSize) {
                ForEach(filteredSizes, id: \.id) { size in
                    Text(displaySize(for: size, measurementSystem: measurementSystem))
                        .tag(size as RingSize?)
                }
            }
            .pickerStyle(.wheel)
            
            Button("Convert") {
                convertSize()
            }
            .padding()
            
            if !convertedSizes.isEmpty {
                HStack {
                    VStack (alignment: .leading) {
                    ForEach(convertedSizes, id: \.id) { size in
                            Text("US: \(size.usSize ?? "-")")
                            Text("EU: \(size.euSize ?? "-")")
                            Text("UK: \(size.ukSize ?? "-")")
                            Text("IT: \(size.swissSize ?? "-")")
                            Text("JP: \(size.jpSize ?? "-")")
                            Text("IN: \(size.inSize ?? "-")")
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .padding()
    }
    
    func isValidSize(for size: RingSize, measurementSystem: MeasurementSystem) -> Bool {
        switch measurementSystem {
        case .us:
            return size.usSize != nil
        case .swiss:
            return size.swissSize != nil
        case .uk:
            return size.ukSize != nil
        case .jp:
            return size.jpSize != nil
        case .eu:
            return size.euSize != nil
        case .india:
            return size.inSize != nil
        case .diameter:
            return size.diameterMM > 0
        }
    }
    
    func displaySize(for size: RingSize, measurementSystem: MeasurementSystem) -> String {
        switch measurementSystem {
        case .us:
            return size.usSize ?? "-"
        case .swiss:
            return size.swissSize ?? "-"
        case .uk:
            return size.ukSize ?? "-"
        case .jp:
            return size.jpSize ?? "-"
        case .eu:
            return size.euSize ?? "-"
        case .india:
            return size.inSize ?? "-"
        case .diameter:
            return size.diameterMM > 0 ? "\(size.diameterMM)" : "-"
        }
    }
    
    func convertSize() {
        guard let selectedSize = selectedRingSize else { return }
        
        convertedSizes = ringSizes.filter { size in
            size.usSize == selectedSize.usSize || size.euSize == selectedSize.euSize
        }
    }
}


#Preview {
    ConverterView()
}
