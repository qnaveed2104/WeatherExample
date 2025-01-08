//
//  WeatherRepositories.swift
//  WeatherExample
//
//  Created by Qazi on 09/01/2025.
//
import SwiftUI

protocol WeatherRepositoryProtocol {
    func getWeatherView(for cityName: String) async throws -> AnyView?
}

struct WeatherRepository: WeatherRepositoryProtocol {
    func getWeatherView(for cityName: String) async throws -> AnyView? {
        return nil
    }
}
