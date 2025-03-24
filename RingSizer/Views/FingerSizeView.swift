//
//  FingerSizeView.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 13/03/2025.
//
import SwiftUI

struct FingerSizeView: View {
    let frameSize: CGFloat = 300
    @State private var height: CGFloat = 85
    let ppi: CGFloat = getDevicePPI()
    
    var heightInMM: CGFloat {
        let inches = height / ppi
        return inches * 25.4
    }
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    HStack {
                        Rectangle()
                            .stroke(.black)
                            .frame(height: height)
                            .foregroundColor(.clear)
                    }
                    HStack {
                        Rectangle()
                            .frame(width: 1, height: height)
                        Text("\(heightInMM, specifier: "%.2f") mm")
                        Spacer()
                        Rectangle()
                            .frame(width: 1, height: height)
                    }
                    .padding(.horizontal, 40)
                }
            }
            .frame(height: frameSize)
//            .border(Color.black, width: 1)
            VStack {
                Slider(value: $height, in: 60...180, step: 1)
                    .padding()
            }
        }
    }
}

#Preview {
    FingerSizeView()
}
