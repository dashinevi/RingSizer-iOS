//
//  ConverterView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 17/03/2025.
//
import SwiftUI

struct ConverterView: View {
    @State private var selectedCountry: Country?
    @State private var selectedRingSize: RingSize?
    @State private var convertedSizes: [RingSize] = []
    
    let countries = Country.allCases
    let ringSizes = RingSize.standardSizes
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.myMainFirst
                    .ignoresSafeArea()
                Image(.ringsForConverter)
                    .resizable()
                    .opacity(0.2)
                
                VStack {
                    HStack {
                        Text("Ring size converter")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    countrySelectionView
                    sizeSelectionView
                    
                    Button(action: {
                        convertSize()
                    }) {
                        Text("Convert")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.accentColor)
                            )
                    }
                    
                    if !convertedSizes.isEmpty {
                        VStack(alignment: .leading) {
                            ForEach(convertedSizes, id: \..id) { size in
                                VStack(alignment: .leading) {
                                    VStack {
                                        HStack {
                                            Text("US:")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Text("\(size.usSize ?? "-")")
                                        }
                                        HStack {
                                            Text("UK:")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Text("\(size.ukSize ?? "-")")
                                        }
                                        HStack {
                                            Text("EU:")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Text("\(size.euSize ?? "-")")
                                        }
                                        HStack {
                                            Text("JP:")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Text("\(size.jpSize ?? "-")")
                                        }
                                        HStack {
                                            Text("IT:")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Text("\(size.swissSize ?? "-")")
                                        }
                                        HStack {
                                            Text("IN:")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Text("\(size.inSize ?? "-")")
                                        }
                                    }
                                    .padding(30)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                                .padding(.bottom, 10)
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                    }
                    Spacer()
                    Text("*Disclaimer: Please understand that this conversion tool and chart is provided as is without any guarantees. There are too many variances, including subjective opinions of fit, time of day (yes your finger size can differ between morning and night), and only carrying half sizes and not quarter sizes among others.")
                        .foregroundColor(.accentColor)
                        .font(.caption)
                        .padding(.bottom, 60)
                    
                }
                .padding()
            }
        }
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

// MARK: file private methods

private extension ConverterView {
    
    var countrySelectionView: some View {
        HStack {
            Picker(selection: $selectedCountry) {
                ForEach(countries, id: \.self) { country in
                    Text(country.rawValue).tag(country)
                }
            } label: {
                Text("Select Country")
                    .foregroundColor(.white)
                    .font(.title3)
            }
            .pickerStyle(.navigationLink)
            
            if selectedCountry == nil {
                Image(systemName: "chevron.right")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.accentColor, lineWidth: 1)
                .foregroundColor(.clear)
            
        )
    }
    var sizeSelectionView: some View {
        HStack {
            Picker(selection: $selectedRingSize) {
                let ms = getMeasurementSystem()
                
                ForEach(getFilteredSizes(ms), id: \.id) { size in
                    Text(displaySize(for: size, measurementSystem: ms))
                        .tag(size as RingSize?)
                }
            } label: {
                Text("Select Ring Size")
                    .foregroundColor(.white)
                    .font(.title3)
            }
            .pickerStyle(.navigationLink)
            
            if selectedRingSize == nil {
                Image(systemName: "chevron.right")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.accentColor, lineWidth: 1)
                .foregroundColor(.clear)
        )
    }
}

// helpers
private extension ConverterView {
    func getMeasurementSystem() -> MeasurementSystem {
        return MeasurementSystem(country: selectedCountry ?? .usa)
    }
    
    func getFilteredSizes(_ measurementSystem: MeasurementSystem) -> [RingSize] {
        return ringSizes.filter { size in
            isValidSize(for: size, measurementSystem: measurementSystem)
        }
    }
}


#Preview {
    
    ConverterView()
    
}
