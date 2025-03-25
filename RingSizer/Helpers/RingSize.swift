//
//  RingSize.swift
//  RingSizer
//
//  Created by Diana Dashinevich on 24/03/2025.
//
import Foundation

enum Country: String, CaseIterable {
    case france = "France"
    case austria = "Austria"
    case germany = "Germany"
    case belgium = "Belgium"
    case norway = "Norway"
    case sweden = "Sweden"
    case finland = "Finland"
    case russia = "Russia"
    
    case usa = "USA"
    case mexico = "Mexico"
    case canada = "Canada"
    
    case uk = "United Kingdom"
    case australia = "Australia"
    case ireland = "Ireland"
    case newZealand = "New Zealand"
    case southAfrica = "South Africa"
    
    case switzerland = "Switzerland"
    case italy = "Italy"
    case spain = "Spain"
    case netherlands = "Netherlands"
    
    case japan = "Japan"
    case china = "China"
    case southAmerica = "South America"
    case turkey = "Turkey"
    case israel = "Israel"
    
    case india = "India"
}

enum MeasurementSystem: String, CaseIterable {
    case us
    case swiss
    case jp
    case eu
    case india
    
    init(country: Country) {
        switch country {
        case .usa, .mexico, .canada:
            self = .us
        case .switzerland, .italy, .spain, .netherlands:
            self = .swiss
        case .japan, .china, .southAmerica, .turkey, .israel:
            self = .jp
        case .france, .austria, .germany, .belgium, .norway, .sweden, .finland, .russia:
            self = .eu
        case .india:
            self = .india
        case .uk, .australia, .ireland, .newZealand, .southAfrica:
            self = .us
        }
    }
}

struct RingSize: Identifiable, Equatable {
    let id = UUID()
    let diameterMM: Double // MM
    let diameterInches: Double // IN
    let euSize: String // EU (ISO), France, Austria, Germany, Belgium, Norway, Sweden, Finland, Russia
    let usSize: String // US, Canada, Mexico
    let ukSize: String? // UK, Australia, Ireland, New Zealand, South Africa
    let swissSize: String? // Switzerland, Italy, Spain, Netherlands
    let jpSize: String? // Japan, China, South America, Turkey, Israel
    let inSize: String? // India
    
    //MARK: - Based on Wikipedia data: https://en.wikipedia.org/wiki/Ring_size
    static let standardSizes: [RingSize] = [
        RingSize(diameterMM: 11.63, diameterInches: 0.458, euSize: "36.5", usSize: "0", ukSize: nil, swissSize: nil, jpSize: nil, inSize: nil),
        RingSize(diameterMM: 11.84, diameterInches: 0.466, euSize: "37.2", usSize: "1/4", ukSize: nil, swissSize: nil, jpSize: nil, inSize: nil),
        RingSize(diameterMM: 12.04, diameterInches: 0.474, euSize: "37.8", usSize: "1/2", ukSize: "A", swissSize: nil, jpSize: nil, inSize: nil),
        RingSize(diameterMM: 12.24, diameterInches: 0.482, euSize: "38.5", usSize: "3/4", ukSize: "A 1/2", swissSize: nil, jpSize: nil, inSize: nil),
        RingSize(diameterMM: 12.45, diameterInches: 0.49, euSize: "39.1", usSize: "1", ukSize: "B", swissSize: nil, jpSize: "1", inSize: nil),
        RingSize(diameterMM: 12.65, diameterInches: 0.498, euSize: "39.7", usSize: "1 1/4", ukSize: "B 1/2", swissSize: nil, jpSize: nil, inSize: nil),
        RingSize(diameterMM: 12.85, diameterInches: 0.506, euSize: "40.4", usSize: "1 1/2", ukSize: "C", swissSize: "0.4", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 13.06, diameterInches: 0.514, euSize: "41.0", usSize: "1 3/4", ukSize: "C 1/2", swissSize: "1", jpSize: nil, inSize: "1"),
        RingSize(diameterMM: 13.26, diameterInches: 0.522, euSize: "41.7", usSize: "2", ukSize: "D", swissSize: "1.7", jpSize: "2", inSize: "2"),
        RingSize(diameterMM: 13.46, diameterInches: 0.53, euSize: "42.3", usSize: "2 1/4", ukSize: "D 1/2", swissSize: "2.3", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 13.67, diameterInches: 0.538, euSize: "42.9", usSize: "2 1/2", ukSize: "E", swissSize: "2.9", jpSize: "3", inSize: "3"),
        RingSize(diameterMM: 13.87, diameterInches: 0.546, euSize: "43.6", usSize: "2 3/4", ukSize: "E 1/2", swissSize: "3.6", jpSize: nil, inSize: "4"),
        RingSize(diameterMM: 14.07, diameterInches: 0.554, euSize: "44.2", usSize: "3", ukSize: "F", swissSize: "4.2", jpSize: "4", inSize: nil),
        RingSize(diameterMM: 14.27, diameterInches: 0.562, euSize: "44.8", usSize: "3 1/4", ukSize: "F 1/2", swissSize: "4.8", jpSize: "5", inSize: "5"),
        RingSize(diameterMM: 14.48, diameterInches: 0.57, euSize: "45.5", usSize: "3 1/2", ukSize: "G", swissSize: "5.5", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 14.68, diameterInches: 0.578, euSize: "46.1", usSize: "3 3/4", ukSize: "G 1/2", swissSize: "6.1", jpSize: "6", inSize: "6"),
        RingSize(diameterMM: 14.88, diameterInches: 0.586, euSize: "46.8", usSize: "4", ukSize: "H", swissSize: "6.8", jpSize: "7", inSize: nil),
        RingSize(diameterMM: 15.09, diameterInches: 0.594, euSize: "47.4", usSize: "4 1/4", ukSize: "H 1/2", swissSize: "7.4", jpSize: nil, inSize: "7"),
        RingSize(diameterMM: 15.29, diameterInches: 0.602, euSize: "48.0", usSize: "4 1/2", ukSize: "I", swissSize: "8", jpSize: "8", inSize: "8"),
        RingSize(diameterMM: 15.49, diameterInches: 0.61, euSize: "48.7", usSize: "4 3/4", ukSize: "J", swissSize: "8.7", jpSize: nil, inSize: "9"),
        RingSize(diameterMM: 15.70, diameterInches: 0.618, euSize: "49.3", usSize: "5", ukSize: "J 1/2", swissSize: "9.3", jpSize: "9", inSize: nil),
        RingSize(diameterMM: 15.90, diameterInches: 0.626, euSize: "50.0", usSize: "5 1/4", ukSize: "K", swissSize: "10", jpSize: nil, inSize: "10"),
        RingSize(diameterMM: 16.10, diameterInches: 0.634, euSize: "50.6", usSize: "5 1/2", ukSize: "K 1/2", swissSize: "10.6", jpSize: "10", inSize: nil),
        RingSize(diameterMM: 16.31, diameterInches: 0.642, euSize: "51.2", usSize: "5 3/4", ukSize: "L", swissSize: "11.2", jpSize: nil, inSize: "11"),
        RingSize(diameterMM: 16.51, diameterInches: 0.65, euSize: "51.9", usSize: "6", ukSize: "L 1/2", swissSize: "11.9", jpSize: "11", inSize: "12"),
        RingSize(diameterMM: 16.71, diameterInches: 0.658, euSize: "52.5", usSize: "6 1/4", ukSize: "M", swissSize: "12.5", jpSize: "12", inSize: nil),
        RingSize(diameterMM: 16.92, diameterInches: 0.666, euSize: "53.1", usSize: "6 1/2", ukSize: "M 1/2", swissSize: "13.1", jpSize: "13", inSize: "13"),
        RingSize(diameterMM: 17.12, diameterInches: 0.674, euSize: "53.8", usSize: "6 3/4", ukSize: "N", swissSize: "13.8", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 17.32, diameterInches: 0.682, euSize: "54.4", usSize: "7", ukSize: "N 1/2", swissSize: "14.4", jpSize: "14", inSize: "14"),
        RingSize(diameterMM: 17.53, diameterInches: 0.69, euSize: "55.1", usSize: "7 1/4", ukSize: "O", swissSize: "15.1", jpSize: nil, inSize: "15"),
        RingSize(diameterMM: 17.73, diameterInches: 0.698, euSize: "55.7", usSize: "7 1/2", ukSize: "O 1/2", swissSize: "15.7", jpSize: "15", inSize: nil),
        RingSize(diameterMM: 17.93, diameterInches: 0.706, euSize: "56.3", usSize: "7 3/4", ukSize: "P", swissSize: "16.3", jpSize: nil, inSize: "16"),
        RingSize(diameterMM: 18.14, diameterInches: 0.714, euSize: "57.0", usSize: "8", ukSize: "P 1/2", swissSize: "17", jpSize: "16", inSize: "17"),
        RingSize(diameterMM: 18.34, diameterInches: 0.722, euSize: "57.6", usSize: "8 1/4", ukSize: "P 3/4", swissSize: "17.6", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 18.54, diameterInches: 0.73, euSize: "58.3", usSize: "8 1/2", ukSize: "Q 1/4", swissSize: "18.3", jpSize: "17", inSize: "18"),
        RingSize(diameterMM: 18.75, diameterInches: 0.738, euSize: "58.9", usSize: "8 3/4", ukSize: "R", swissSize: "18.9", jpSize: nil, inSize: "19"),
        RingSize(diameterMM: 18.95, diameterInches: 0.746, euSize: "59.5", usSize: "9", ukSize: "R 1/2", swissSize: "19.5", jpSize: "18", inSize: nil),
        RingSize(diameterMM: 19.15, diameterInches: 0.754, euSize: "60.2", usSize: "9 1/4", ukSize: "S", swissSize: "20.2", jpSize: nil, inSize: "20"),
        RingSize(diameterMM: 19.35, diameterInches: 0.762, euSize: "60.8", usSize: "9 1/2", ukSize: "S 1/2", swissSize: "20.8", jpSize: "19", inSize: "21"),
        RingSize(diameterMM: 19.56, diameterInches: 0.77, euSize: "61.4", usSize: "9 3/4", ukSize: "T", swissSize: "21.4", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 19.76, diameterInches: 0.778, euSize: "62.1", usSize: "10", ukSize: "T 1/2", swissSize: "22.1", jpSize: "20", inSize: "22"),
        RingSize(diameterMM: 19.96, diameterInches: 0.786, euSize: "62.7", usSize: "10 1/4", ukSize: "U", swissSize: "22.7", jpSize: "21", inSize: "23"),
        RingSize(diameterMM: 20.17, diameterInches: 0.794, euSize: "63.4", usSize: "10 1/2", ukSize: "U 1/2", swissSize: "23.4", jpSize: "22", inSize: nil),
        RingSize(diameterMM: 20.37, diameterInches: 0.802, euSize: "64.0", usSize: "10 3/4", ukSize: "V", swissSize: "24", jpSize: nil, inSize: "24"),
        RingSize(diameterMM: 20.57, diameterInches: 0.81, euSize: "64.6", usSize: "11", ukSize: "V 1/2", swissSize: "24.6", jpSize: "23", inSize: "25"),
        RingSize(diameterMM: 20.78, diameterInches: 0.818, euSize: "65.3", usSize: "11 1/4", ukSize: "W", swissSize: "25.3", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 20.98, diameterInches: 0.826, euSize: "65.9", usSize: "11 1/2", ukSize: "W 1/2", swissSize: "25.9", jpSize: "24", inSize: "26"),
        RingSize(diameterMM: 21.18, diameterInches: 0.834, euSize: "66.6", usSize: "11 3/4", ukSize: "X", swissSize: "26.6", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 21.39, diameterInches: 0.842, euSize: "67.2", usSize: "12", ukSize: "X 1/2", swissSize: "27.2", jpSize: "25", inSize: "27"),
        RingSize(diameterMM: 21.59, diameterInches: 0.85, euSize: "67.8", usSize: "12 1/4", ukSize: "Y", swissSize: "27.8", jpSize: nil, inSize: "28"),
        RingSize(diameterMM: 21.79, diameterInches: 0.858, euSize: "68.5", usSize: "12 1/2", ukSize: "Y 1/2", swissSize: "28.5", jpSize: "26", inSize: nil),
        RingSize(diameterMM: 22.00, diameterInches: 0.866, euSize: "69.1", usSize: "12 3/4", ukSize: "Z", swissSize: "29.1", jpSize: nil, inSize: "29"),
        RingSize(diameterMM: 22.20, diameterInches: 0.874, euSize: "69.7", usSize: "13", ukSize: "Z 1/2", swissSize: "29.7", jpSize: "27", inSize: "30"),
        RingSize(diameterMM: 22.40, diameterInches: 0.882, euSize: "70.4", usSize: "13 1/4", ukSize: "Z1", swissSize: "30.4", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 22.61, diameterInches: 0.89, euSize: "71.0", usSize: "13 1/2", ukSize: nil, swissSize: "31", jpSize: nil, inSize: "31"),
        RingSize(diameterMM: 22.81, diameterInches: 0.898, euSize: "71.7", usSize: "13 3/4", ukSize: "Z2", swissSize: "31.7", jpSize: nil, inSize: "32"),
        RingSize(diameterMM: 23.01, diameterInches: 0.906, euSize: "72.3", usSize: "14", ukSize: "Z3", swissSize: "32.3", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 23.22, diameterInches: 0.914, euSize: "72.9", usSize: "14 1/4", ukSize: nil, swissSize: "32.9", jpSize: nil, inSize: "33"),
        RingSize(diameterMM: 23.42, diameterInches: 0.922, euSize: "73.6", usSize: "14 1/2", ukSize: "Z4", swissSize: "33.6", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 23.62, diameterInches: 0.93, euSize: "74.2", usSize: "14 3/4", ukSize: nil, swissSize: "34.2", jpSize: nil, inSize: "34"),
        RingSize(diameterMM: 23.83, diameterInches: 0.938, euSize: "74.8", usSize: "15", ukSize: nil, swissSize: "34.8", jpSize: nil, inSize: "35"),
        RingSize(diameterMM: 24.03, diameterInches: 0.946, euSize: "75.5", usSize: "15 1/4", ukSize: nil, swissSize: "35.5", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 24.23, diameterInches: 0.954, euSize: "76.1", usSize: "15 1/2", ukSize: nil, swissSize: "36.1", jpSize: nil, inSize: "36"),
        RingSize(diameterMM: 24.43, diameterInches: 0.962, euSize: "76.8", usSize: "15 3/4", ukSize: nil, swissSize: "36.8", jpSize: nil, inSize: nil),
        RingSize(diameterMM: 24.64, diameterInches: 0.97, euSize: "77.4", usSize: "16", ukSize: nil, swissSize: "37.4", jpSize: nil, inSize: "37"),
    ]
}
