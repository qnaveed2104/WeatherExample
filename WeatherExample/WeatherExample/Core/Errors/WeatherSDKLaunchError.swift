//
//  Untitled.swift
//  WeatherExample
//
//  Created by Qazi on 09/01/2025.
//
import Foundation

enum WeatherError: LocalizedError {
    case sdkInitializationFailed

    var errorDescription: String? {
        switch self {
        case .sdkInitializationFailed:
            return "Failed to initialize the Weather SDK."
        }
    }
}

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
