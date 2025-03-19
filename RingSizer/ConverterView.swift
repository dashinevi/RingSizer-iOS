//
//  ConverterView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 17/03/2025.
//
import SwiftUI

struct RingSize: Identifiable {
    let id = UUID()
    let diameter: Double
    let sizes: [String: String]
}

struct ConverterView: View {
    let countries = ["USA/Canada", "United Kingdom", "France", "Germany", "Japan", "Switzerland"]
    
    let ringSizes: [RingSize] = [
        RingSize(diameter: 14.0, sizes: ["USA/Canada": "3", "United Kingdom": "F", "France": "44", "Germany": "14", "Japan": "4", "Switzerland": "4"]),
        RingSize(diameter: 14.4, sizes: ["USA/Canada": "3½", "United Kingdom": "G", "France": "45¼", "Germany": "14½", "Japan": "5½", "Switzerland": "6⅓"]),
        RingSize(diameter: 14.8, sizes: ["USA/Canada": "4", "United Kingdom": "H½", "France": "46½", "Germany": "15", "Japan": "7", "Switzerland": "6½"]),
        RingSize(diameter: 15.2, sizes: ["USA/Canada": "4½", "United Kingdom": "I½", "France": "47¾", "Germany": "15¼", "Japan": "8", "Switzerland": "8"]),
        RingSize(diameter: 15.6, sizes: ["USA/Canada": "5", "United Kingdom": "J½", "France": "49", "Germany": "15¾", "Japan": "9", "Switzerland": "9½"]),
        RingSize(diameter: 16.0, sizes: ["USA/Canada": "5½", "United Kingdom": "L", "France": "50¾", "Germany": "16", "Japan": "10½", "Switzerland": "10¾"]),
        RingSize(diameter: 16.5, sizes: ["USA/Canada": "6", "United Kingdom": "M", "France": "51½", "Germany": "16½", "Japan": "12", "Switzerland": "12¾"]),
        RingSize(diameter: 16.9, sizes: ["USA/Canada": "6½", "United Kingdom": "N", "France": "52¾", "Germany": "17", "Japan": "13", "Switzerland": "14"]),
        RingSize(diameter: 17.3, sizes: ["USA/Canada": "7", "United Kingdom": "O", "France": "54", "Germany": "17¼", "Japan": "14", "Switzerland": "15¼"]),
        RingSize(diameter: 17.7, sizes: ["USA/Canada": "7½", "United Kingdom": "P", "France": "55¼", "Germany": "17¾", "Japan": "15", "Switzerland": "16½"]),
        RingSize(diameter: 18.2, sizes: ["USA/Canada": "8", "United Kingdom": "Q", "France": "56¾", "Germany": "18", "Japan": "16", "Switzerland": "17¾"]),
        RingSize(diameter: 18.6, sizes: ["USA/Canada": "8½", "United Kingdom": "Q½", "France": "58", "Germany": "18½", "Japan": "17", "Switzerland": "18½"]),
        RingSize(diameter: 19.0, sizes: ["USA/Canada": "9", "United Kingdom": "R½", "France": "59¼", "Germany": "19", "Japan": "18", "Switzerland": "20"]),
        RingSize(diameter: 19.4, sizes: ["USA/Canada": "9½", "United Kingdom": "S½", "France": "60¾", "Germany": "19½", "Japan": "19", "Switzerland": "21"]),
        RingSize(diameter: 19.8, sizes: ["USA/Canada": "10", "United Kingdom": "T½", "France": "61¾", "Germany": "20", "Japan": "20", "Switzerland": "21¾"]),
        RingSize(diameter: 20.2, sizes: ["USA/Canada": "10½", "United Kingdom": "U½", "France": "62¾", "Germany": "20¼", "Japan": "22", "Switzerland": "22¾"]),
        RingSize(diameter: 20.6, sizes: ["USA/Canada": "11", "United Kingdom": "V½", "France": "64¼", "Germany": "20¾", "Japan": "23", "Switzerland": "24"]),
        RingSize(diameter: 21.0, sizes: ["USA/Canada": "11½", "United Kingdom": "W½", "France": "66", "Germany": "21", "Japan": "24", "Switzerland": "25¾"]),
        RingSize(diameter: 21.4, sizes: ["USA/Canada": "12", "United Kingdom": "Y", "France": "67¼", "Germany": "21¼", "Japan": "25", "Switzerland": "27½"]),
        RingSize(diameter: 21.8, sizes: ["USA/Canada": "12½", "United Kingdom": "Z", "France": "68", "Germany": "21¾", "Japan": "26", "Switzerland": "28¾"]),
        RingSize(diameter: 22.2, sizes: ["USA/Canada": "13", "United Kingdom": "Z + 1", "France": "69", "Germany": "22", "Japan": "27", "Switzerland": "29¼"]),
        RingSize(diameter: 22.6, sizes: ["USA/Canada": "13½", "United Kingdom": "Z + 1.5", "France": "71", "Germany": "22.6", "Japan": "-", "Switzerland": "31"])
        
    ]
    
    @State private var fromCountry = "USA/Canada"
    @State private var toCountry = "United Kingdom"
    @State private var selectedSize: String = "3"
    
    var convertedSize: String {
        guard let ringSize = ringSizes.first(where: { $0.sizes[fromCountry] == selectedSize }) else {
            return "N/A"
        }
        return ringSize.sizes[toCountry] ?? "N/A"
    }
    
    var body: some View {
        VStack {
            Text("Ring Size Converter")
                .font(.title)
                .padding()
            
            HStack {
                VStack {
                    Text("From:")
                    Picker("From Country", selection: $fromCountry) {
                        ForEach(countries, id: \ .self) { country in
                            Text(country)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                VStack {
                    Text("To:")
                    Picker("To Country", selection: $toCountry) {
                        ForEach(countries, id: \ .self) { country in
                            Text(country)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .padding()
            
            Picker("Ring Size", selection: $selectedSize) {
                ForEach(ringSizes.compactMap { $0.sizes[fromCountry] }, id: \ .self) { size in
                    Text(size)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()
            
            Text("Converted Size: \(convertedSize)")
                .font(.headline)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ConverterView()
}
